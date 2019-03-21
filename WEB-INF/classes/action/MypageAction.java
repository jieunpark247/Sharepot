package action;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.CommandAction;
import dao.mypageDAO;
import dto.Item;
import dto.Offer;
import dto.QandA;
import dto.Rent;

public class MypageAction implements CommandAction{
	public static final int ALLRENT = 999;
	public static final int NOWRENT = 998;
	public static final int DELAYRENT = 997;
	public static final int DELAYALL=996;
	public static final int OFFER = 995;
	Date date = null;
	
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		int member_id =  Integer.parseInt((String) session.getAttribute("idKey"));
		String tab= request.getParameter("tab");
		String view =null;
		int perPage=10;
		int thisPage=1;
		String strPage=request.getParameter("thisPage");
		if(strPage!=null){
			thisPage = Integer.parseInt(strPage);
		}
		mypageDAO dao = new mypageDAO();
		
		if(tab==null || tab.equals("RENTAL")) {
			//대여 페이지를 위한..
			String rent = request.getParameter("rent");
			if(rent ==null) {
				rent = "rentalNow";
			}
			view="mypageMain.jsp";
			
			
			if(rent.equals("rentalNow")) {
				//현재 대여 상황
				Rent[] rents = dao.getRents(thisPage,perPage,NOWRENT,member_id);
				
				//반납 예상 날짜
				Timestamp[] returnExpect = dao.getReturnExpect(thisPage, perPage,member_id);
				
				//연체 일수
				long[] delayDay = new long[rents.length];
				int idx=0;
				for(Rent unit: rents) {
					delayDay[idx] = (System.currentTimeMillis() - returnExpect[idx].getTime())/(24*60*60*1000);
					idx++;
				}
				
				/*
				 * boolean[] isDelay = new boolean[rents.length]; int idx1=0;
				 * 
				 * for(Rent temp:rents) { long dif = (System.currentTimeMillis()-
				 * temp.getRent_date().getTime())/(24*60*60*1000); if(dif >=3) { isDelay[idx1] =
				 * true; }else { isDelay[idx1] = false; } idx1++; }
				 */
				
				int totalNum = dao.getTotalNum(NOWRENT,member_id);
				int totalPageNum = totalNum/perPage;
				
				if(totalNum % perPage !=0){
					totalPageNum++;
				}
				
				
				request.setAttribute("totalNum", totalNum);
				request.setAttribute("rents", rents);
				request.setAttribute("thisPage", thisPage);
				request.setAttribute("totalPageNum", totalPageNum);
				request.setAttribute("returnExpect", returnExpect);
				request.setAttribute("delayDay", delayDay);
				//request.setAttribute("isDelay", isDelay);
				
				
			}else if(rent.equals("rentalAll")) {
				//여기 수정
				//대출 / 반납 기록
				String sub = request.getParameter("sub_rent");
				int totalNum = 0;
				if(sub==null) {
					view = "mypageRentalAll.jsp";
					Rent[] rents = dao.getRents(thisPage, perPage,ALLRENT,member_id);
					totalNum = dao.getTotalNum(ALLRENT,member_id);
					request.setAttribute("rents", rents);
					
				}else {
					view="offerList.jsp";
					Offer[] offers = dao.getOffer(member_id,thisPage, perPage);
					totalNum = dao.getTotalNum(OFFER, member_id);
					request.setAttribute("offers", offers);
				}
				
				int totalPageNum = totalNum/perPage;
				if(totalNum % perPage !=0){
					totalPageNum++;
				}
				
				request.setAttribute("totalNum", totalNum);
				request.setAttribute("thisPage", thisPage);
				request.setAttribute("totalPageNum", totalPageNum);
				//여기 수정 end
				
			}else {
				//연체 내역
				view = "mypageRentalDelayFee.jsp";
				Rent[] rents = dao.getRents(thisPage, perPage,DELAYRENT,member_id);

				int totalNum = dao.getTotalNum(DELAYRENT,member_id);

				int totalPageNum = totalNum/perPage;
				if(totalNum % perPage !=0){
					totalPageNum++;
				}
				long[] delayDay = new long[rents.length];
				int idx = 0;
				
				for(Rent unit : rents){
					if(unit.getState()==0){
						//대여 중이라면
						delayDay[idx] = (System.currentTimeMillis() - unit.getRent_date().getTime())/(24*60*60*1000);
					}else{
						delayDay[idx] = (unit.getReturn_date().getTime() - unit.getRent_date().getTime())/(24*60*60*1000) -1;
					}
					idx++;
				}
				request.setAttribute("totalNum", totalNum);
				request.setAttribute("rents", rents);
				request.setAttribute("thisPage", thisPage);
				request.setAttribute("totalPageNum", totalPageNum);
				request.setAttribute("delayDay", delayDay);
				
				
				Rent[] rent_bf = dao.getRents(thisPage, perPage, DELAYALL,member_id);
				int totalNum_bf = dao.getTotalNum(DELAYALL,member_id);
				long[] delayDay_bf = new long[rent_bf.length];
				
				//페이징
				int totalPageNumBf = totalNum_bf/perPage;
				if(totalNum_bf % perPage !=0){
					totalPageNumBf++;
				}
				
				//
				int idex =0;
				for(Rent temp: rent_bf){
					delayDay_bf[idex] = (temp.getReturn_date().getTime()-temp.getRent_date().getTime())/(24*60*60*1000) - 1;
					idex++;
				}
				
				request.setAttribute("rent_bf", rent_bf);
				request.setAttribute("totalNum_bf", totalNum_bf);
				request.setAttribute("delayDay_bf", delayDay_bf);
			}

		}else if(tab.equals("LIKE")){
			view="mypageLike.jsp";
			Item[] likeItems = dao.getLikeItems(thisPage,perPage,member_id);
			int totalNum = dao.getTotalNumItem(member_id);
			int totalPageNum = totalNum/perPage;
			if(totalNum % perPage !=0){
				totalPageNum++;
			}
			
			
			request.setAttribute("likeItem", likeItems);
			request.setAttribute("total", totalPageNum);
			request.setAttribute("thisPage", thisPage);
			
		}else if(tab.equals("QNA")){
			view="mypageQna.jsp";
			QandA[] qna = dao.getQna(member_id);
			request.setAttribute("qna", qna);
			

		}else if(tab.equals("EDIT")){
			view="mypageEditCheck.jsp";
			request.setAttribute("member_id", member_id);
		}
		
		return view;
	}
	
}

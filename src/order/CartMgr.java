package order;

import java.util.Hashtable;

public class CartMgr {
	private Hashtable hCart = new Hashtable();
	
	public void addCart(OrderBean obean) {
		String card_no = obean.getCard_no();
		if(hCart.containsKey(card_no)) {
			return;
		}else
		hCart.put(card_no, obean);
		
	}
	public Hashtable getCartList() {
		return hCart;
	}
	public void updateCart(OrderBean obean) {
		String card_no = obean.getCard_no();	
		hCart.put(card_no, obean);
		
	}
	public void deleteCart(OrderBean obean) {
		String card_no = obean.getCard_no();	
		hCart.remove(card_no);
	}
}

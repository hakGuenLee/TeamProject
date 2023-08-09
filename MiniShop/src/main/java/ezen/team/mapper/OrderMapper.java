package ezen.team.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import ezen.team.domain.AddrDTO;
import ezen.team.domain.CartDTO;
import ezen.team.domain.OrderDTO;
import ezen.team.domain.UserDTO;

//OrderServiceImpl과 연결

@Mapper
public interface OrderMapper {

	List<CartDTO> getOrderList(String id);

	void inputOrder(int prod_no);

	void orderDelete(int no);

	void orderRegister(List<CartDTO> list,String order_no);

	void DeleteOrder(List<CartDTO> list);

	void OMRegister(UserDTO user);

	OrderDTO getOrderInfo(String order_no);

	//해당 아이디의 배송지 별칭 목록 가져오기
	List<String> getNickAddr(String id);

	//별칭에 맞는 주소 가져오기
	AddrDTO getAddrInfo(String nickname, String id);
	
	//기본주소 가져오기
	AddrDTO getDefaultAddr(String id, String addrName);
	
	

	// 장바구니를 주문 리스트에 담기 ( 보류 )
//	void inputOrder(List<CartDTO> list);

}

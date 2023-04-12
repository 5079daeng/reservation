package kr.co.reserve.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.reserve.domain.Reservation;
import kr.co.reserve.mapper.ReservationMapper;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	ReservationMapper mapper;

	@Override
	public int insertReserveData(Reservation rsv) {
		return mapper.insertReservationDate(rsv);

	}

	@Override
	public int insertReserveDetailData(int reserveNo, int adult, int child, int adultBf, int childBf, int price) {
		return mapper.insertRsvDetail(reserveNo, adult, child, adultBf, childBf, price);

	}

	@Override
	public int getLastReserveNo() {
		return mapper.getLastReserveNo();

	}

	@Override
	public List<Reservation> getMyRsvList(int memberNo) {
		List<Reservation> list = mapper.getRsvList(memberNo);
		return list;
	}

	@Override
	public HashMap<String, String> getRsvDetail(int reserveNo) {
		return mapper.getRsvDetail(reserveNo);

	}

	@Override
	public List<Reservation> getChartData() {
		return mapper.getReservation();

	}

	@Override
	public int modify(Reservation rsv) {
		return mapper.modify(rsv);

	}

}

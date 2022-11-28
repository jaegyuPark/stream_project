package home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import home.bean.HomeDTO;
import home.dao.HomeDAO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private HomeDAO homeDAO;
	
	
	@Override
	public List<HomeDTO> getBanner() {
		
		return homeDAO.getBanner();
	}

}

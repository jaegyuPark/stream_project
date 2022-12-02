package home.dao;

import java.util.List;

import home.bean.HomeDTO;

public interface HomeDAO {
	public List<HomeDTO> getBanner();

	public List<HomeDTO> getTopTen();

	public List<HomeDTO> getTopTenMovie();

	public List<HomeDTO> getTopTenTV();
}
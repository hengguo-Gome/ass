package com.gome.ass.dao.system;

import java.util.List;
import java.util.Map;

import com.gome.ass.entity.ShWorkerLocation;

public interface ShWorkerLocationDao {

	public void insert(ShWorkerLocation shWorkerLocation);

	public List<ShWorkerLocation> findWorkerLocation(Map<String,Object> inMap);
}

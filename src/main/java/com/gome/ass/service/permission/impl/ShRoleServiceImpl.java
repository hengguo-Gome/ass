package com.gome.ass.service.permission.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gome.ass.dao.permission.ShRoleDao;
import com.gome.ass.dao.permission.ShRoleMenuDao;
import com.gome.ass.dao.system.ShMenuDao;
import com.gome.ass.entity.ShMenu;
import com.gome.ass.entity.ShPosition;
import com.gome.ass.entity.ShRole;
import com.gome.ass.service.permission.ShRoleService;
import com.gome.ass.util.JsonUtil;
import com.gome.ass.util.UUIDUtil;
import com.gome.common.page.Page;

@Service("shRoleService")
public class ShRoleServiceImpl implements ShRoleService {

	@Resource
	private ShRoleDao shRoleDao;
	@Resource
	private ShRoleMenuDao shRoleMenuDao;
	@Resource
	private ShMenuDao shMenuDao;
	
	@Override
	public List<Map<String, Object>> getRolePageList(Page page) {
		return this.shRoleMenuDao.getRolePageList(page);
	}

	@Override
	public List<Map<String, Object>> getRoleResource(Map<String, Object> inMap) {
		return this.shRoleMenuDao.getRoleResource(inMap);
	}
	
	@Override
	public Map<String, String> insertShPositions(MultipartFile file) throws IOException {
		List<ShPosition> positions = parseExcelFile(file);
		Set<String> set = new HashSet<String>();
		for(ShPosition p: positions){
			set.add(p.getCode());
		}
		this.shRoleDao.deleteShPositions(new ArrayList<String>(set));
		Map<String, String> resultMap = new HashMap<String, String>();
		String success = "{";
		String failure = "{";
		
		for(int i=0 ; i< positions.size() ; i++){
			ShPosition position = positions.get(i);
			position.setId(UUIDUtil.getUUID());
			try{
				this.shRoleDao.insertShPosition(position);
				success +=position.getCode()+" "+position.getMenuId()+",";
			}catch(Exception e){
				failure +=position.getCode()+" "+position.getMenuId()+",";
			}
		}
		resultMap.put("success", success+"}");
		resultMap.put("failure", failure+"}");
		return resultMap;
	
	}
	class PositionLocation {
		public String code;
		public String name;
		public Integer index;
		public PositionLocation getPositionByCode(List<PositionLocation> list, String code){
			for(PositionLocation p: list){
				if(code == p.code){
					return p;
				}
			}
			return null;
		}
		public PositionLocation getPositionByIndex(List<PositionLocation> list, Integer index){
			for(PositionLocation p: list){
				if(index == p.index){
					return p;
				}
			}
			return null;
		}
		public void setPositionName(List<PositionLocation> list, String name, Integer index){
			PositionLocation p = this.getPositionByIndex(list, index);
			if(p != null){
				p.name = name;
			}
		}
	}
	
	class MenuLocation implements Cloneable{
		public String code;
		public String name;
		public Integer pindex;
		public boolean isP;
		@Override
		protected Object clone() throws CloneNotSupportedException{
			return super.clone();
		}
		//根据子菜单code查询父菜单，确保父菜单在子菜单之前加上
		public MenuLocation getParent(Set<MenuLocation> list, String code) throws CloneNotSupportedException{
			if("".equals(code)) return null;
			for(MenuLocation m: list){
				if(code.substring(0, 3).equals(m.code)){
					return (MenuLocation) m.clone();
				}
			}
			return null;
		}
		public boolean existParent(Set<MenuLocation> list, String code){
			for(MenuLocation m: list){
				if(code.equals(m.code)){
					return true;
				}
			}
			return false;
		}
		@Override
		public boolean equals(Object o){
			if(this == o){
				return true;
			}else{
				if(o instanceof MenuLocation){
					MenuLocation obj = (MenuLocation)o;
					if(obj.pindex.equals(this.pindex) && obj.code.equals(this.code))
						return true;
				}
				return false;
			}
		}
		@Override
		public int hashCode(){
			return this.code.hashCode() * 17  + this.pindex.hashCode() * 117;
		}
		public String toString(){
			return this.code+" "+this.pindex;
		}
	}
	public static void main(String[] args) throws IOException {
		new ShRoleServiceImpl().parseExcelFile(null);
	}
	private List<ShPosition> parseExcelFile(MultipartFile file) throws IOException {
		InputStream input = file.getInputStream();
//		InputStream input = new FileInputStream("E://Positions.xlsx");
		Workbook workBook = null;
		try {
			workBook = new XSSFWorkbook(input);//Excel 2007
        } catch (Exception ex) {
        	workBook = new HSSFWorkbook(input);//兼容Excel 2003
        }
		List<PositionLocation> ps = new ArrayList<ShRoleServiceImpl.PositionLocation>();
		Set<MenuLocation> ms = new HashSet<ShRoleServiceImpl.MenuLocation>();
		Sheet sheet = workBook.getSheetAt(0);
		if (sheet != null) {
			for (int i = 0; i < sheet.getPhysicalNumberOfRows(); i++) {
				Row row = sheet.getRow(i);
				MenuLocation m1 = new MenuLocation();
				for (int j = 0; j < row.getPhysicalNumberOfCells(); j++) {
					String cellStr = null;
					Cell cell = row.getCell(j);
					System.out.print("<"+(cell != null?cell.getStringCellValue():"") +">");//TODO Remove
					PositionLocation p1 = new PositionLocation();
					if((i==0 && j<=3) || (i==1 && j<=3)){
						continue;
					}else if(i==0 && j>3){
						cellStr = cell.getStringCellValue();
						p1.index = j;
						p1.code = cellStr;
						ps.add(p1);
					}else if(i==1 && j>3){
						cellStr = cell.getStringCellValue();
						new PositionLocation().setPositionName(ps, cellStr, j);
					} else{
						if(j==0 && cell != null && !cell.getStringCellValue().equals("") ){//parent code
							m1.isP = true;
							m1.code = cell.getStringCellValue();;
						}else if(cell !=null && !cell.getStringCellValue().equals("") && (j==1)){//parent name
							m1.name = cell.getStringCellValue();
						}else if(cell !=null  && !cell.getStringCellValue().equals("") && (j==2)){// code
							m1.isP = false;
							m1.code = cell.getStringCellValue();
						}else if(cell !=null  && !cell.getStringCellValue().equals("") && (j==3)){// name
							m1.name = cell.getStringCellValue();
						}else{
							if(i==5 && j==4)
								System.out.println();
							if(cell !=null && !"".equals(cell.getStringCellValue())){
								if("X".equalsIgnoreCase(cell.getStringCellValue())){
									MenuLocation tm;
									try {
										tm = (MenuLocation) m1.clone();
										tm.pindex = j; 
										ms.add(tm);
										//如果父菜单没选，则加上
										if(!tm.isP && j>3){
											MenuLocation pm = new MenuLocation().getParent(ms, tm.code);
											if(pm != null){
												pm.pindex = j;
												ms.add(pm);
											}
										}
									} catch (CloneNotSupportedException e) {
										e.printStackTrace();
									}
									
								}
							}else{
								if(m1.isP && !new MenuLocation().existParent(ms, m1.code) && j>3){//将父菜单保存，后面对子菜单勾选父菜单没有勾选有用
									MenuLocation tm;
									try {
										tm = (MenuLocation) m1.clone();
										tm.pindex = Integer.MAX_VALUE;
										ms.add(tm);
									} catch (CloneNotSupportedException e) {
										e.printStackTrace();
									}
								}
							}
								
						}
					}
				}
				System.out.println();
			}
		}
		return convert(ps, ms);
	}

	private List<ShPosition> convert(List<PositionLocation> ps,	Set<MenuLocation> ms) {
		List<ShPosition> positions = new ArrayList<ShPosition>();
		for(MenuLocation m: ms){
			ShPosition p = new ShPosition();
			PositionLocation pl = new PositionLocation().getPositionByIndex(ps, m.pindex);
			if(pl != null){
				p.setCode(pl.code);
				p.setName(pl.name);
				p.setMenuId(m.code);
				p.setMenuName(m.name);
				positions.add(p);
			}
		}
		return positions;

	}

	@Override
	public String updateRoles(ShRole role, Map<String, Object> map, String action) throws Exception {
		Map<String,Object> result = new HashMap<String,Object>();
		String[] lists = "".equals((String)map.get("menuIds"))?null:((String)map.get("menuIds")).split(",");
		if(lists == null || lists.length == 0){
			result.put("result", " 至少需要为角色添加一个菜单");
			result.put("status", "error");
			return JsonUtil.javaObjectToJsonString(result);
		}
		map.put("menuIds", lists);
		if("update".equals(action)){
			if(role.getRoleType().equals(this.shRoleMenuDao.getByRoleId(role.getRoleId()))){
				result.put("result", " 不允许修改角色类型， 请先删除再添加");
				result.put("status", "error");
				return JsonUtil.javaObjectToJsonString(result);
			}
			if("2".equals(role.getRoleType())){
				this.shRoleDao.delShPositions(Arrays.asList(role.getRoleId()));
				List<ShPosition> ps = new ArrayList<ShPosition>();
				for(String id: lists){
					ShPosition p = new ShPosition();
					ShMenu menu = this.shMenuDao.getMenuById(id);
					p.setId(UUIDUtil.getUUID());
					p.setCode(role.getRoleId());
					p.setName(role.getRoleName());
					p.setMenuId(menu.getMenuId());
					p.setMenuName(menu.getMenuName());
					ps.add(p);
				}
				this.shRoleDao.insertShPositions(ps);
			}else{
				this.shRoleDao.deleteShRoleResource(role.getRoleId());
				this.shRoleDao.insertRoleResourceBatch(map);
				this.shRoleDao.updateShRole(map);;
			}
			result.put("result", "修改角色成功！");
			result.put("status", "success");
		}else if("insert".equals(action)){
			if("2".equals(role.getRoleType())){
				List<ShPosition> ps = new ArrayList<ShPosition>();
				for(String id: lists){
					ShPosition p = new ShPosition();
					ShMenu menu = this.shMenuDao.getMenuById(id);
					p.setId(UUIDUtil.getUUID());
					p.setCode(role.getRoleId());
					p.setName(role.getRoleName());
					p.setMenuId(menu.getMenuId());
					p.setMenuName(menu.getMenuName());
					ps.add(p);
				}
				this.shRoleDao.insertShPositions(ps);
			}else{
				this.shRoleDao.insertShRole(map);
				this.shRoleDao.insertRoleResourceBatch(map);
			}
			result.put("result", "新增角色成功！");
			result.put("status", "success");
		}
		return JsonUtil.javaObjectToJsonString(result);
	}

	@Override
	public void deleteRoles(List<String> roleList, List<String> poList) {
		if(roleList.size() > 0){
			this.shRoleDao.delRoleResourceBatch(roleList);
			this.shRoleDao.deleteShRoleBatch(roleList);
		}
		if(poList.size() > 0)
			this.shRoleDao.deleteShPositions(poList);
	}
	
	public String getRoleTypeByRoleId(String roleId){
		return this.shRoleMenuDao.getByRoleId(roleId);
	}
}

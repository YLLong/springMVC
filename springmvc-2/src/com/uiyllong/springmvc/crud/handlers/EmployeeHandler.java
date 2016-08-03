package com.uiyllong.springmvc.crud.handlers;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uiyllong.springmvc.crud.dao.DepartmentDao;
import com.uiyllong.springmvc.crud.dao.EmployeeDao;
import com.uiyllong.springmvc.crud.entities.Employee;

@Controller
public class EmployeeHandler {

	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	private DepartmentDao departmentDao;
	
	@ModelAttribute
	public void getEmployee(@RequestParam(value="id", required=false) Integer id, Map<String, Object> map) {
		if (id != null) {
			map.put("employee", employeeDao.getEmployeeById(id));
		}
	}
	
	/**
	 * 修改员工信息
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp", method=RequestMethod.PUT)
	public String update(Employee employee) {
		employeeDao.save(employee);
		return "redirect:/emps";
	}
	
	/**
	 * 修改员工信息，转到input页面并回显信息
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/emp/{id}", method=RequestMethod.GET)
	public String input(@PathVariable("id") Integer id, Map<String, Object> map) {
		map.put("employee", employeeDao.getEmployeeById(id));
		map.put("departments", departmentDao.getDepartments());
		return "input";
	}
	
	/**
	 * 根据id删除对应得员工
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id) {
		employeeDao.deleteEmployee(id);
		return "redirect:/emps";
	}
	
	/**
	 * 添加新员工
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp", method=RequestMethod.POST)
	public String save(@Valid Employee employee, Errors reslutError, Map<String, Object> map) {
		if (reslutError.getErrorCount() > 0) {
			System.out.println("你出错了！");
			for (FieldError error : reslutError.getFieldErrors()) {
				System.out.println(error.getField() + ":" + error.getDefaultMessage());
			}
			map.put("departments", departmentDao.getDepartments());
			return "input";
		}
		System.out.println("EmployeeHandler.save()" + employee);
		employeeDao.save(employee);
		return "redirect:/emps";
	}
	
	/**
	 * 转到添加新的员工信息，并回显部门信息
	 * @return
	 */
	@RequestMapping(value="/emp", method=RequestMethod.GET)
	public String input(Map<String, Object> map) {
		map.put("departments", departmentDao.getDepartments());
		map.put("employee", new Employee());
		return "input";
	}
	
	/**
	 * 显示所有员工信息
	 * @param map
	 * @return
	 */
	@RequestMapping("/emps")
	public String list(Map<String, Object> map) {
		map.put("emps", employeeDao.getAll());
		return "list";
	}
	
}

package com.uiyllong.springmvc.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.uiyllong.springmvc.crud.entities.Department;
import com.uiyllong.springmvc.crud.entities.Employee;

@Component
public class EmployeeConverter implements Converter<String, Employee> {

	@Override
	public Employee convert(String arg0) {
		if (arg0 != null) {
			String[] str = arg0.split("-");
			if (str != null && str.length == 4) {
				String lastName = str[0];
				String email = str[1];
				Integer gender = Integer.valueOf(str[2]);
				Department department = new Department();
				department.setId(Integer.valueOf(str[3]));
				Employee employee = new Employee(null, lastName, email, gender, department);
				System.out.println(arg0 + "<--EmployeeConverter.convert()-->" + employee);
				return employee;
			}
		}
		return null;
	}

}

package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.dao.MysqlDAO;
import com.example.dao.ProductListDAO;
import com.example.dao.TradeDAO;
import com.example.domain.SellVO;

@RunWith(SpringJUnit4ClassRunner.class)  //SpringJUnit4ClassRunner.class를 먼저 import한다.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MysqlTest {
    @Autowired
    private TradeDAO dao;
    
    
    @Test
    public void getTime(SellVO vo){
    	String pmodel="sh-adbo1";
    	String ssize="260";
    	dao.sinsert(vo);
    }
}

package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ProductVO1;
import com.example.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
   @Autowired
   SqlSession session;
   String namespace="com.example.mapper.UserMapper";
   
   @Override
   public UserVO read(String uid) {
      return session.selectOne(namespace + ".login", uid);
   }
   
   @Override
   public void update(UserVO vo) {
      session.update(namespace + ".update", vo);
   }

   @Override
   public void delete(UserVO vo) {
      session.update(namespace + ".delete", vo);
      
   }

   @Override
   public void insert(UserVO vo) {
      session.insert(namespace + ".insert", vo);
      
   }

   @Override
   public List<UserVO> list(Criteria cri) {
      
      return session.selectList(namespace + ".list");
   }

   @Override
   public int total() {
      return session.selectOne(namespace + ".total");
   }
   
   @Override
   public void lpupdate(ProductVO1 vo, String uid) {
      session.update(namespace+".lpupdate",vo);
      
   }

   

   @Override
   public UserVO read2(String uid, String uemail, String uname, String utel) {
      HashMap<String, Object> map = new HashMap<>();
      map.put("uid", uid);
      map.put("uemail",uemail);
      map.put("uname", uname);
      map.put("utel", utel);
      return session.selectOne(namespace + ".login2",map);
   }

   @Override
   public void updatereset(UserVO vo) {
      session.update(namespace + ".updatereset",vo);
      
   }
}
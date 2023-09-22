package com.cooory.memo.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.cooory.memo.post.domain.Post;

@Repository
public interface PostRepository {

	public int insertPost(
			@Param("userId") int userId
			, @Param("title") String title
			, @Param("content") String content); 
	
	public List<Post> selectPostList(@Param("userId") int userId);
	
}

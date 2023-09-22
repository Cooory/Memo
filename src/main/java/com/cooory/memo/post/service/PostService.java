package com.cooory.memo.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cooory.memo.post.domain.Post;
import com.cooory.memo.post.repository.PostRepository;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	public int addPost(int userId, String title, String content) {
		
		int count = postRepository.insertPost(userId, title, content);
		
		return count;
		
	}
	
	public List<Post> getPostList(int userId) {

		List<Post> postList = postRepository.selectPostList(userId);
		
		return postList;
	}
}

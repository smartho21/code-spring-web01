package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	private Long[] bnoArr = {6656L,6655L,6654L,6653L,6652L,6651L,6650L,6649L,6648L,6647L};
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info("=====================================");
		log.info(mapper);
	}
	
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i->{
			ReplyVO vo = new ReplyVO();
			
			//게시물의 번호
			vo.setBno(bnoArr[i%10]);
			vo.setReply("댓글테스트"+i);
			vo.setReplyer("replyer"+i);
			
			mapper.insert(vo);
		});
	}

	@Test
	public void testRead() {
		long targetRno = 11L;
		ReplyVO vo = mapper.read(targetRno);
		log.info("=====================ReplyVO : "+vo);
	}
	
	@Test
	public void testDelete() {
		Long targetRno = 3L;
		int reslutInt = mapper.delete(targetRno);
		log.info("=======================delete : "+reslutInt);
	}
	
	@Test
	public void testUpdate() {
		Long targetRno = 11L;
		ReplyVO vo = mapper.read(targetRno);
		log.info("=======================vo : "+vo);
		vo.setReply("Updated Reply ");
		int count = mapper.update(vo);

		log.info("=======================update : "+count);
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		//6656L
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		replies.forEach(reply -> log.info(reply));
	}
}

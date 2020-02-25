package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.BbsVO;

public class BbsDAO {

	//전체게시물의 수를 반환하는 기능 - list.jsp에서 호출
	public static int getTotalCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.selectOne("bbs.totalCount");
		
		ss.close();
		
		return cnt;
	}
	
	//원하는 페이지의 게시물들을 목록화면으로
	//표현하기 위해 배열로 반환하는 기능 - list.jsp
	public static BbsVO[] getList(int begin, int end) {
		BbsVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		List<BbsVO> list = ss.selectList("bbs.bbsList", map);
		
		if(list != null && !list.isEmpty()) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
			
			ss.close();
		}
		
		return ar;
	}
	
}

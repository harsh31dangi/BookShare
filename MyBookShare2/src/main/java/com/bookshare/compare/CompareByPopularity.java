package com.bookshare.compare;

import java.util.Comparator;

import com.bookshare.model.BookVO;

public class CompareByPopularity implements Comparator<BookVO> {

	@Override
	public int compare(BookVO b1,BookVO b2) {
		
		if(b1.getViews() > b2.getViews() )
			return 1;
		else if(b1.getViews() < b2.getViews())
			return -1;
		else
			return 0;
	}

	
}

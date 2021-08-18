package com.tour.controller;

import com.tour.controller.action.Action;
import com.tour.controller.action.TourDeleteAction;
import com.tour.controller.action.TourListAction;
import com.tour.controller.action.TourViewAction;
import com.tour.controller.action.TourWriteAction;
import com.tour.controller.action.TourWriteFormAction;

public class ActionFactory {
private static ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {
		super();
	}
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory : " + command);
		
		if (command.equals("tour_list")) {
			action = new TourListAction();
		} else if (command.equals("tour_write_form")) {
			action = new TourWriteFormAction();
		} else if (command.equals("tour_write")) {
			action = new TourWriteAction();
		} else if (command.equals("tour_delete")) {
			action = new TourDeleteAction();
		} else if (command.equals("tour_view")) {
			action = new TourViewAction();
		}
		return action;
	}
}

package lk.sliit.hotelManagement.controller.kitchenController;

import lk.sliit.hotelManagement.controller.SuperController;
import lk.sliit.hotelManagement.service.custom.IndexLoginBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OnlineOrders {
    @Autowired
    IndexLoginBO indexLoginBO;

    String alertMsg = KitchenUtil.defaultAlert;

    @GetMapping("/onlineOrders")
    public String loginPage(Model model) {
        model.addAttribute("defaultAlert",KitchenUtil.defaultAlert);
        model.addAttribute("alert",alertMsg);
        model.addAttribute("loggerName", indexLoginBO.getEmployeeByIdNo(SuperController.idNo));
        return "onlineOrders";
    }
}

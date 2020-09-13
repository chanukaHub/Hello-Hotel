package lk.sliit.hotelManagement.controller.foodAndBevarage.Restaurant;

import lk.sliit.hotelManagement.controller.SuperController;
import lk.sliit.hotelManagement.dto.kitchen.FoodItemDTO;
import lk.sliit.hotelManagement.dto.restaurant.OnlineCustomerDTO;
import lk.sliit.hotelManagement.dto.restaurant.restaurantOnlineOrder.RestaurantOnlineOrderDTO;
import lk.sliit.hotelManagement.service.custom.IndexLoginBO;
import lk.sliit.hotelManagement.service.custom.KitchenBO;
import lk.sliit.hotelManagement.service.custom.OnlineCustomerBO;
import lk.sliit.hotelManagement.service.custom.RestaurantBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class OnlineOrder {
    @Autowired
    IndexLoginBO indexLoginBO;
    @Autowired
    OnlineCustomerBO onlineCustomerBO;
    @Autowired
    KitchenBO kitchenBO;
    @Autowired
    RestaurantBO restaurantBO;

    @GetMapping("/onlineOrder")
    public String loadForm_validationSaveMode(Model model, HttpSession session, HttpServletRequest request) {

        try {
            int onlineCustomerId = Integer.parseInt(session.getAttribute("userId").toString());
            model.addAttribute("loggerId", onlineCustomerBO.findOne(onlineCustomerId));
//            Load All Food
            List<FoodItemDTO> p1 = kitchenBO.findFoodItems();
            if(p1.isEmpty()){
                request.setAttribute("loginError","Not Any Item Fond Under Restaurant " +
                        "Type Please Add Data Under Restaurant Type" );
            }

            model.addAttribute("loadAllFoods", p1);
        } catch (NullPointerException d) {
            return "onlineOrder";
        }
        return "onlineOrder";

    }
    @PostMapping("/saveOnlineOrder")
    public String saveForm(@ModelAttribute RestaurantOnlineOrderDTO onlineOrderDTO, HttpSession session) {

        try {
            RestaurantOnlineOrderDTO top = restaurantBO.findHighestOnlineOrderId();
            int x = (top.getOrderId()) + 1;
            onlineOrderDTO.setOrderId((x));
        } catch (NullPointerException e) {

            System.out.println("In Try Catch");
            onlineOrderDTO.setOrderId((1));
        }


        try {
            int onlineCustomerId = Integer.parseInt(session.getAttribute("userId").toString());
            onlineOrderDTO.setCustomer(onlineCustomerId);
            restaurantBO.saveOnlineOrder(onlineOrderDTO);
        } catch (NullPointerException d) {
            return "redirect:/onlineOrder";
        }
        return "redirect:/onlineOrder";
    }

}
package lk.sliit.hotelManagement.service.custom;

import lk.sliit.hotelManagement.dto.restaurant.OnlineCustomerDTO;

public interface OnlineCustomerBO {
    OnlineCustomerDTO findHighestOnlineCustomerId();

    void saveOnlineCustomer(OnlineCustomerDTO onlineCustomerDTO);

    OnlineCustomerDTO findByUserNameAndPassword(String userName, String password);

    OnlineCustomerDTO findOne(int getOnlineCustomerId);
}

package lk.sliit.hotelManagement.service.custom.impl;

import lk.sliit.hotelManagement.dao.kitchenDAO.KitchenDAO;
import lk.sliit.hotelManagement.dao.kitchenDAO.MenuDAO;
import lk.sliit.hotelManagement.dto.kitchen.FoodItemDTO;
import lk.sliit.hotelManagement.dto.kitchen.MenuDTO;
import lk.sliit.hotelManagement.entity.kitchen.FoodItem;
import lk.sliit.hotelManagement.entity.kitchen.Menu;
import lk.sliit.hotelManagement.service.custom.KitchenBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Transactional
@Service
public class KitchenBOImpl implements KitchenBO {
    @Autowired
    KitchenDAO kitchenDAO;
    @Autowired
    MenuDAO menuDAO;
    @Override
    public void saveFoodItem(FoodItemDTO foodItemDTO) {
        kitchenDAO.save(new FoodItem
                (foodItemDTO.getItemId(),
                        foodItemDTO.getItemName(),
                        foodItemDTO.getUnitePrice(),
                        foodItemDTO.getSrc(),
                        foodItemDTO.getItemCategory()));
    }

    @Override
    public List<FoodItemDTO> findFoodItems() {
        Iterable<FoodItem> foodItems = kitchenDAO.findAll();
        List<FoodItemDTO> foodItemDTOList = new ArrayList<>();

        for (FoodItem item: foodItems) {
            foodItemDTOList.add(new FoodItemDTO(item.getItemId(),
                    item.getName(),
                    item.getUnitePrice(),
                    item.getCategory(),
                    item.getSrc()));
        }
        return foodItemDTOList;
    }

    @Override
    public FoodItemDTO findHighestId() {
        FoodItem lastItem = null;
        try {
            lastItem = kitchenDAO.findTopByOrderByItemIdDesc();
        } catch (Exception e){

        }

        return new FoodItemDTO(lastItem.getItemId());
    }

    @Override
    public void deleteFoodItem(String foodItemId) {
        kitchenDAO.delete(foodItemId);
    }

    @Override
    public MenuDTO findHighestFoodPackId() {
        Menu lastPack = null;
        try {
            lastPack = menuDAO.findTopByOrderByMenuIdDesc();
        } catch (Exception e){

        }
        return new MenuDTO(lastPack.getMenuId());
    }

    @Override
    public void saveMenuItem(MenuDTO menuDTO) {
        menuDAO.save(new Menu(
                menuDTO.getMenuId(),
                menuDTO.getName(),
                menuDTO.getType(),
                menuDTO.getPicture(),
                menuDTO.getUnitPrice()
        ));
    }

    @Override
    public List<MenuDTO> findMenuItems() {
        Iterable<Menu> menuItems = menuDAO.findAll();
        List<MenuDTO> menuDTOList = new ArrayList<>();

        for (Menu item: menuItems){
            menuDTOList.add(new MenuDTO(
                    item.getMenuId(),
                    item.getName(),
                    item.getType(),
                    item.getPicture(),
                    item.getUnitPrice()
            ));
        }
        return menuDTOList;
    }

    @Override
    public void deleteMenuItem(String menuItemId) {
        menuDAO.delete(menuItemId);
    }

    @Override
    public MenuDTO findMenuItemById(String menuItemId) {
        Menu menuItem = menuDAO.findOne(menuItemId);
        MenuDTO menuDTO = new MenuDTO(menuItem.getMenuId(),
                menuItem.getName(),
                menuItem.getType(),
                menuItem.getPicture(),
                menuItem.getUnitPrice());
        return menuDTO;
    }
}
$("#0001").click(function () {
    var tableId = $('#selectedTableId').val();

    var s = myCheck(tableId)
    if (!s) {
        return;
    }
});


function myCheck(selectId) {
    var numberofRows = $("#reservationTable tr").length;


    for (var i = 0; i < numberofRows; i++) {
        var id = $("#selectedTableId(" + (i + 1) + ") td:nth-child(1)").text();

        if (selectId == id) {
            var tableId = $('#selectedTableId').val();
            console.log(tableId+"ssssssssssssssssssssssss")

            var table = document.getElementById("selectedTableId");
            table.rows[i].cells[0].innerHTML = tableId;

   console.log("In False")
            return false;
        }
    } console.log("In True")
    return true;
}


function getValue() {

    var list = [];

    var numberOfRows = $("#tblOrder tr").length;
    var odId = $("#barIdNo").text();
    var cId = $("#customerId").text();
    var str,stre ="";
    for (var i = 0; i < numberOfRows; i++) {
        var itemId = $("#tblOrder tr:nth-child(" + (i + 1) + ") td:nth-child(1)").text();



        if (i >= 0) {
            list.push({
                itemCode: name,
                itemName: itemId,
                itemPrice: price,
                qty: qty,
                totalPrice: total

            });
             str =  itemId+" "+price+" "+qty+" ";
             stre += str;
        }
    }

    $("#itemPay").val(stre);





    // $("#odId").val(odId);
    // $("#cId").val(cId);
    // $("#user").val(cId);
}
/*
//var exit = false;
$("#btnAdd").click(function () {
    $("#tblOrder tr").off("dblclick");
    var itemCode = $('#itemCode').val();
    var itemName = $("#itemName").val();
    var itemPrice = $('#price').val();
    var buyAmount = $('#qty').val();
    var total = itemPrice * buyAmount;

    // var total = itemPrice * buyAmount;
    //
    // var  bol =myCheck(itemCode);
    //
    // if (itemCode == "" || itemName == "" || qty == "" || qty == '0' || price == "") {
    //     return;
    // }
    if (itemCode == "" || itemName == "") {
        alert("Please Select Item In Table");
        return;
    }
    if (buyAmount == "") {
        alert("Buy Amount is Empty");
        return;
    }
    if (itemPrice == "") {
        alert("Item Price Is Empty");
        return;
    }
    var s = myCheck(itemCode)

    if (!s) {
        return;
    }
    //
    // '<tr><input type="hidden" name="id1" value="' + itemCode +'"/>'+
    // '<td> <input name = itemCode+\"_\"+itemCode value="' + itemCode +'" />  itemCode  </td>' +
    var row =
        // "<tr>" + " <input type=\"hidden\" name=\"id1\" value= itemCode />" +
        '<tr><input type="hidden" name="id1" value="'+itemCode+'"/>'+
        '<td> <input name = "itemCode" value = "'+ itemCode +'" />  itemCode </td>' +
        '<td> <input name = "itemName" value="' +itemName+ '" /> itemName  </td>' +
        '<td> <input name = "itemPrice" value="' + itemPrice +'" />  itemPrice  </td>' +
        '<td> <input name = "buyAmount" value="' + buyAmount +'" />  buyAmount  </td>' +
        '<td> <input name = "total"     value="' + total +'" /> + total  </td>'  +
        '<td><div><i class="fa fa-trash"></i></div></td>' +
        "</tr>";
    app(row);

    $("#tblOrder tr td:last-child div").off("click");
    $("#tblOrder tr td:last-child div").click(function () {
        if (confirm("Are you sure whether you want to delete this Student?")) {
            $(this).parents("tr").fadeOut(1000, function () {
                $(this).remove();
            });
        }

    });
});


function app(a) {
    $("#tblOrder").append(a);
    return;

}

function myCheck(selectId) {
    var numberofRows = $("#tblOrder tr").length;

    var itemCode = $('#itemCode').val();
    var itemName = $("#itemName").val();
    var itemPrice = $('#price').val();
    var buyAmount = $('#qty').val();
    var total = itemPrice * buyAmount;

    for (var i = 0; i < numberofRows; i++) {
        var id = $("#tblOrder tr:nth-child(" + (i + 1) + ") td:nth-child(1)").text();
          console.log(id+"dddddddddddddddddddddddddddddddd")

        if (selectId == itemCode) {
            var oldqty = $("#tblOrder tr:nth-child(" + (i + 1) + ") td:nth-child(4)").text();
            var oldtotal = $("#tblOrder tr:nth-child(" + (i + 1) + ") td:nth-child(5)").text();

            var buyAmount1 = $('#qty').val();
            buyAmount = parseInt(buyAmount1);
            oldqty = parseInt(oldqty);
            oldtotal = parseInt(oldtotal);
            buyAmount = oldqty + buyAmount;
            total = oldtotal + total;


            var table = document.getElementById("tblOrder");
            table.rows[i].cells[0].innerHTML = itemCode;
            table.rows[i].cells[1].innerHTML = itemName;
            table.rows[i].cells[2].innerHTML = itemPrice;
            table.rows[i].cells[3].innerHTML = buyAmount;
            table.rows[i].cells[4].innerHTML = total;

            return false;
        }
    }
    return true;
}


function getValue() {

    var list = [];

    var numberOfRows = $("#tblOrder tr").length;
    var odId = $("#barIdNo").text();
    var cId = $("#customerId").text();
    var str,stre ="";
    for (var i = 0; i < numberOfRows; i++) {
        var itemId = $("#tblOrder tr:nth-child(" + (i + 1) + ") td:nth-child(1)").text();
        var name = $("#tblOrder tr:nth-child(" + (i + 1) + ") td:nth-child(2)").text();
        var price = $("#tblOrder tr:nth-child(" + (i + 1) + ") td:nth-child(3)").text();
        var qty = $("#tblOrder tr:nth-child(" + (i + 1) + ") td:nth-child(4)").text();
        var total = $("#tblOrder tr:nth-child(" + (i + 1) + ") td:nth-child(5)").text();


        if (i >= 0) {
            list1.push({
                itemCode: name,
                itemName: itemId,
                itemPrice: price,
                qty: qty,
                totalPrice: total

            });
             // str =  itemId+" "+ name +" "+price+" "+qty+" "+total+"  ";
             // stre += str;
        }
    }
    console.log(list1);
    $("#itemPay").val(list1);

}
*/


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

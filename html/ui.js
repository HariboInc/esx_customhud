$(function() {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "money") {
            $('.mymoney').html('$' + item.myMoney.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.") + '')
            $('.mybank').html('$' + item.bankMoney.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.") + '')
            $('.myblackmoney').html('$' + item.blackMoney.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.") + '')
            $('.updateId').text('' + item.id + '')
            $('.updatePlayersCount').text('' + item.playersonline + '')

            if (item.myfood < 10) {
                $(".foodbox").attr("src", "img/food0.png");
            } else if (item.myfood < 20) {
                $(".foodbox").attr("src", "img/food1.png");
            } else if (item.myfood < 40) {
                $(".foodbox").attr("src", "img/food2.png");
            } else if (item.myfood < 60) {
                $(".foodbox").attr("src", "img/food3.png");
            } else if (item.myfood < 80) {
                $(".foodbox").attr("src", "img/food4.png");
            } else if (item.myfood < 100) {
                $(".foodbox").attr("src", "img/food5.png");
            }

            if (item.mywater < 10) {
                $(".waterbox").attr("src", "img/drink0.png");
            } else if (item.mywater < 20) {
                $(".waterbox").attr("src", "img/drink1.png");
            } else if (item.mywater < 40) {
                $(".waterbox").attr("src", "img/drink2.png");
            } else if (item.mywater < 60) {
                $(".waterbox").attr("src", "img/drink3.png");
            } else if (item.mywater < 80) {
                $(".waterbox").attr("src", "img/drink4.png");
            } else if (item.mywater < 100) {
                $(".waterbox").attr("src", "img/drink5.png");
            }
        }
    })
})
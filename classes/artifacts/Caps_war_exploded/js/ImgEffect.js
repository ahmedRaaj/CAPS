/**
 * Created by Zwe Htat Naing on 05/12/2016.
 */
$(window).load(function() { //start after HTML, images have loaded

    var InfiniteRotator =
        {
            init: function()
            {
                //initial fade-in time (in milliseconds)
                var initialFadeIn = 800;

                //interval between items (in milliseconds)
                var itemInterval = 1800;

                //cross-fade time (in milliseconds)
                var fadeTime = 1000;

                //count number of items
                var numberOfItems = $('.rotating-item').length;





                //set current item
                var currentItem = 0;

                //show first item
                $('.rotating-item').eq(currentItem).fadeIn(initialFadeIn);


                //loop through the items
                var infiniteLoop = setInterval(function(){
                    $('.rotating-item').eq(currentItem).fadeOut(fadeTime);

                    if(currentItem == numberOfItems -1){
                        currentItem = 0;
                    }else{
                        currentItem++;
                    }
                    $('.rotating-item').eq(currentItem).fadeIn(fadeTime);

                }, itemInterval);


            }
        };

    InfiniteRotator.init();


    var InfiniteRotator1 =
        {
            init: function()
            {
                //initial fade-in time (in milliseconds)
                var initialFadeIn = 100;

                //interval between items (in milliseconds)
                var itemInterval =1850;

                //cross-fade time (in milliseconds)
                var fadeTime = 1000;

                //count number of items

                var numberOfItems1 = $('.rotating-item1').length;





                //set current item
                var currentItem1 = 0;

                //show first item
                $('.rotating-item').eq(currentItem1).fadeIn(initialFadeIn);


                //loop through the items


                $('.rotating-item1').eq(currentItem1).fadeIn(initialFadeIn);

                //loop through the items
                var infiniteLoop1 = setInterval(function(){
                    $('.rotating-item1').eq(currentItem1).fadeOut(fadeTime);

                    if(currentItem1 == numberOfItems1 -1){
                        currentItem1 = 0;
                    }else{
                        currentItem1++;
                    }
                    $('.rotating-item1').eq(currentItem1).fadeIn(fadeTime);

                }, itemInterval);

            }
        };

    InfiniteRotator1.init();
    var InfiniteRotator2 =
        {
            init: function()
            {
                //initial fade-in time (in milliseconds)
                var initialFadeIn = 100;

                //interval between items (in milliseconds)
                var itemInterval = 1950;

                //cross-fade time (in milliseconds)
                var fadeTime = 1000;


                var numberOfItems2 = $('.rotating-item2').length;





                //set current item
                var currentItem2 = 0;

                //show first item

                $('.rotating-item2').eq(currentItem2).fadeIn(initialFadeIn);

                //loop through the items
                var infiniteLoop2 = setInterval(function(){
                    $('.rotating-item2').eq(currentItem2).fadeOut(fadeTime);

                    if(currentItem2 == numberOfItems2 -1){
                        currentItem2 = 0;
                    }else{
                        currentItem2++;
                    }
                    $('.rotating-item2').eq(currentItem2).fadeIn(fadeTime);

                }, itemInterval);

            }
        };

    InfiniteRotator2.init();
    var InfiniteRotator3 =
        {
            init: function()
            {
                //initial fade-in time (in milliseconds)
                var initialFadeIn = 100;

                //interval between items (in milliseconds)
                var itemInterval = 1900;

                //cross-fade time (in milliseconds)
                var fadeTime = 1000;


                var numberOfItems3 = $('.rotating-item3').length;





                //set current item
                var currentItem3 = 0;

                //show first item

                $('.rotating-item3').eq(currentItem3).fadeIn(initialFadeIn);

                //loop through the items
                var infiniteLoop3 = setInterval(function(){
                    $('.rotating-item3').eq(currentItem3).fadeOut(fadeTime);

                    if(currentItem3 == numberOfItems3 -1){
                        currentItem3 = 0;
                    }else{
                        currentItem3++;
                    }
                    $('.rotating-item3').eq(currentItem3).fadeIn(fadeTime);

                }, itemInterval);

            }
        };

    InfiniteRotator3.init();
    var InfiniteRotator4 =
        {
            init: function()
            {
                //initial fade-in time (in milliseconds)
                var initialFadeIn = 100;

                //interval between items (in milliseconds)
                var itemInterval = 2000;

                //cross-fade time (in milliseconds)
                var fadeTime = 1000;


                var numberOfItems4 = $('.rotating-item4').length;





                //set current item
                var currentItem4 = 0;

                //show first item

                $('.rotating-item4').eq(currentItem4).fadeIn(initialFadeIn);

                //loop through the items
                var infiniteLoop4 = setInterval(function(){
                    $('.rotating-item4').eq(currentItem4).fadeOut(fadeTime);

                    if(currentItem4 == numberOfItems4 -1){
                        currentItem4 = 0;
                    }else{
                        currentItem4++;
                    }
                    $('.rotating-item4').eq(currentItem4).fadeIn(fadeTime);

                }, itemInterval);

            }
        };

    InfiniteRotator4.init();

    var InfiniteRotator5 =
        {
            init: function()
            {
                //initial fade-in time (in milliseconds)
                var initialFadeIn = 100;

                //interval between items (in milliseconds)
                var itemInterval = 2150;

                //cross-fade time (in milliseconds)
                var fadeTime = 1000;


                var numberOfItems5 = $('.rotating-item5').length;





                //set current item
                var currentItem5 = 0;

                //show first item

                $('.rotating-item5').eq(currentItem5).fadeIn(initialFadeIn);

                //loop through the items
                var infiniteLoop5 = setInterval(function(){
                    $('.rotating-item5').eq(currentItem5).fadeOut(fadeTime);

                    if(currentItem5 == numberOfItems5 -1){
                        currentItem5 = 0;
                    }else{
                        currentItem5++;
                    }
                    $('.rotating-item5').eq(currentItem5).fadeIn(fadeTime);

                }, itemInterval);

            }
        };

    InfiniteRotator5.init();

    var InfiniteRotator6 =
        {
            init: function()
            {
                //initial fade-in time (in milliseconds)
                var initialFadeIn = 100;

                //interval between items (in milliseconds)
                var itemInterval = 2050;

                //cross-fade time (in milliseconds)
                var fadeTime = 1000;


                var numberOfItems6 = $('.rotating-item6').length;





                //set current item
                var currentItem6 = 0;

                //show first item

                $('.rotating-item6').eq(currentItem6).fadeIn(initialFadeIn);

                //loop through the items
                var infiniteLoop6 = setInterval(function(){
                    $('.rotating-item6').eq(currentItem6).fadeOut(fadeTime);

                    if(currentItem6 == numberOfItems6 -1){
                        currentItem6 = 0;
                    }else{
                        currentItem6++;
                    }
                    $('.rotating-item6').eq(currentItem6).fadeIn(fadeTime);

                }, itemInterval);

            }
        };

    InfiniteRotator6.init();
});


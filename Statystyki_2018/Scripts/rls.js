

var xvalue
var yvalue
function printMousePos(event) {

    xvalue = event.pageX;
    yvalue = event.pageY;

}

document.addEventListener("click", printMousePos);


function openPopup(strOpen) {


    //toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no
    //open(strOpen, "Info", "menubar=no,location=no,resizable=no,scrollbars=yes,status=yes, width=400, height=200, top=" + yvalue + ", left=" + xvalue);
    open(strOpen, "Info", "toolbar=no, location=no, directories=no, status=no, menubar=no,  copyhistory=no,scrollbars=yes, width=600, height=400, top=" + yvalue + ", left=" + xvalue);
}

      jQuery(function ($) {
          var scrollingStartDistance = $("#menu").offset().top;

          $(document).scroll(function () {
              var scrollTop = $(document).scrollTop();

              $("#menu").toggleClass("scrolling", scrollTop > scrollingStartDistance);
              $("#tbl_manu").toggleClass("scrolling", scrollTop > scrollingStartDistance);
              
          });
      });


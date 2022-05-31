$(".imgAdd").click(function(){
        // $(this).closest(".row").find('.imgAdd')
        // .before(
        //     '<div class="col-sm-2 img_section">' +
        //     '   <div class="imagePreview"></div>' +
        //     '       <input type="file" name = "img_input" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;">' +
        //     '</div>'
        // );

    $(this).closest(".row").find('.imgAdd')
        .before(
            '<div class="col-sm-2 img_section">' +
            '   <div class="imagePreview"></div>' +
            '       <input type="file" name = "img_input" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;">' +
            '</div>'
        );

    $("input[name = img_input]").last().trigger("click");
});


$(document).on("click", "i.del" , function() {
// 	to remove card
    $(this).parent().remove();
// to clear image
    // $(this).parent().find('.imagePreview').css("background-image","url('')");
});

$(function() {

    $(document).on("change",".uploadFile", function()
    {
        var uploadFile = $(this);
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader){
            return; // no file selected, or no FileReader support
        }

        if (/^image/.test(files[0].type)){ // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file

            reader.onloadend = function(){ // set image data as background of div
                // this.result를 input 속성으로 넣어놔야할듯
                uploadFile.closest(".img_section").find('.imagePreview').css("background-image", "url("+this.result+")");
            }
        }
    });
});
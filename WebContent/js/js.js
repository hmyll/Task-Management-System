/**
 * 
 */
alert("hello");
    //验证地址
    function Age() {
            //验证年龄
            var age = document.getElementById("txtage").value;
            var ageReg = /(^[1-9][0-9]?$)|^100$/;
            if (!ageReg.test(age)) {
                span_age.innerHTML = "请输入1~100的数字!";
                return false;
            }
            else {
                span_age.innerHTML = "格式正确";
                return true;
            }
        }
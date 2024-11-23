
<!DOCTYPE html>
<html>
<head>
    <title>Form Validation</title>
    <script type="text/javascript">
        function validateForm() {
            var firstName = document.forms.f.name1.value;
            var lastName = document.forms.f.name2.value;
            var email = document.forms.f.email.value;
            var altEmail = document.forms.f.altmail.value;
            var password = document.forms.f.password.value;
            var confirmPassword = document.forms.f.confirmpassword.value;
            var phone = document.forms.f.phone.value;
            var gender = document.forms.f.r1;
            var country = document.forms.f.country.value;
            var languages = document.forms.f.language;
            var terms = document.forms.f.confirm;
            var selectedGender = null;
            var selectedLanguage = null;

            if (firstName == null || firstName.trim() === "") {
                alert("Enter first name");
                return false;
            }
            if (!(/^[a-zA-Z]+$/).test(firstName)) {
                alert("First name should contain only letters");
                return false;
            }
            if (lastName == null || lastName.trim() === "") {
                alert("Enter last name");
                return false;
            }
            if (!(/^[a-zA-Z]+$/).test(lastName)) {
                alert("Last name should contain only letters");
                return false;
            }
            if (!(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/).test(email)) {
                alert("Enter a valid email address");
                return false;
            }
            if (!(/^\d{10}$/).test(phone)) {
                alert("Phone number must be exactly 8 digits");
                return false;
            }
            if (password.length < 6) {
                alert("Password must be at least 6 characters long");
                return false;
            }
            if (password !== confirmPassword) {
                alert("Passwords do not match");
                return false;
            }
            for (var i = 0; i < gender.length; i++) {
                if (gender[i].checked) {
                    selectedGender = gender[i].value;
                }
            }
            if (!selectedGender) {
                alert("Select gender");
                return false;
            }
            if (country === "000") {
                alert("Select a country");
                return false;
            }
            for (var i = 0; i < languages.length; i++) {
                if (languages[i].checked) {
                    selectedLanguage = languages[i].value;
                }
            }
            if (!selectedLanguage) {
                alert("Select at least one language");
                return false;
            }
            if (!(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/).test(altEmail)) {
                alert("Enter a valid alternate email address");
                return false;
            }
            if (altEmail === email) {
                alert("Alternate email must be different from the primary email");
                return false;
            }
            if (!terms.checked) {
                alert("You must agree to the terms and conditions");
                return false;
            }
            alert("Form submitted successfully!");
            var z = window.open("", "Submission Details", "width=350,height=350");
            z.document.writeln("<h3>Name: " + firstName + " " + lastName + "</h3>");
            z.document.writeln("<h3>Gender: " + selectedGender + "</h3>");
            z.document.writeln("<h3>Country: " + country + "</h3>");
            z.document.writeln("<h3>Language: " + selectedLanguage + "</h3>");
            z.document.writeln("<h3>Email: " + email + "</h3>");
            z.document.writeln("<h3>Alternate Email: " + altEmail + "</h3>");
        }
    </script>
</head>
<body>
    <form name="f" onsubmit="return validateForm()" method="post">
        <h1 align="center">Email</h1>
        <h2 align="center">New User Signup Form</h2>
        <p>
            <label>First Name: <input name="name1" type="text" size="20"></label>
            <label>Last Name: <input name="name2" type="text" size="20"></label><br>
            <label>Email: <input name="email" type="text" size="20"></label><br>
            <label>Phone Number: <input name="phone" type="number" size="10"></label><br>
            <label>Password: <input name="password" type="password" size="20"></label><br>
            <label>Confirm Password: <input name="confirmpassword" type="password" size="20"></label><br>
            Gender: 
            <input type="radio" name="r1" value="Male">Male 
            <input type="radio" name="r1" value="Female">Female<br>
            Country: 
            <select name="country">
                <option value="000" selected="selected">Select country</option>
                <option value="Austria">Austria</option>
                <option value="Tokyo">Tokyo</option>
                <option value="India">India</option>
                <option value="Beijing">Beijing</option>
            </select><br>
            Languages Known: 
            <input type="checkbox" name="language" value="Tamil">Tamil 
            <input type="checkbox" name="language" value="English">English 
            <input type="checkbox" name="language" value="Hindi">Hindi 
            <input type="checkbox" name="language" value="Malayalam">Malayalam<br>
            <label>Alternate Email: <input name="altmail" type="text" size="20"></label><br>
        </p>
        <center>
            <input type="checkbox" name="confirm">I agree to the terms and conditions<br>
            <input type="submit" value="Submit">
            <input type="reset" value="Reset">
        </center>
    </form>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Form Validation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f0f0; /* Background color */
        }

        .form-container {
            background-color: #f0f0f0; /* Same background color as the body */
            padding: 20px;
            border-radius: 8px;
            width: 300px;
            box-sizing: border-box;
            border: 1px solid #ccc; /* Optional: add a border to define the form edges */
        }

        h3 {
            text-align: center;
        }

        form {
            margin: 10px 0;
        }

        input {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border: none;
        }

        .hidden {
            display: none;
        }

        .error {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>

<div id="regForm" class="form-container">
    <h3>Registration</h3>
    <form onsubmit="return validate('reg')">
        <input type="text" id="regName" placeholder="Name">
        <input type="email" id="regEmail" placeholder="Email">
        <input type="password" id="regPassword" placeholder="Password">
        <input type="submit" value="Register">
        <div id="regError" class="error"></div>
    </form>
</div>

<div id="loginForm" class="form-container hidden">
    <h3>Login</h3>
    <form onsubmit="return validate('login')">
        <input type="email" id="loginEmail" placeholder="Email">
        <input type="password" id="loginPassword" placeholder="Password">
        <input type="submit" value="Login">
        <div id="loginError" class="error"></div>
    </form>
</div>

<div id="profileForm" class="form-container hidden">
    <h3>Profile</h3>
    <form onsubmit="return validate('profile')">
        <input type="text" id="profileName" placeholder="Name">
        <input type="text" id="profilePhone" placeholder="Phone (10 digits)" pattern="^\d{10}$">
        <input type="submit" value="Update Profile">
        <div id="profileError" class="error"></div>
    </form>
</div>

<div id="paymentForm" class="form-container hidden">
    <h3>Payment</h3>
    <form onsubmit="return validate('payment')">
        <input type="text" id="cardNumber" placeholder="Card Number" pattern="\d{16}">
        <input type="date" id="expiryDate">
        <input type="text" id="cvv" placeholder="CVV" pattern="\d{3}">
        <input type="submit" value="Pay">
        <div id="paymentError" class="error"></div>
    </form>
</div>

<script>
    function validate(form) {
        let error = "";
        if (form === 'reg') {
            const name = document.getElementById('regName').value;
            const email = document.getElementById('regEmail').value;
            const password = document.getElementById('regPassword').value;
            if (!name || !email || !password) error = "All fields are required.";
            else if (password.length < 6) error = "Password too short.";
            if (error) document.getElementById('regError').innerText = error;
            else { document.getElementById('regForm').classList.add('hidden'); document.getElementById('loginForm').classList.remove('hidden'); }
        } else if (form === 'login') {
            const email = document.getElementById('loginEmail').value;
            const password = document.getElementById('loginPassword').value;
            if (!email || !password) error = "Email and Password are required.";
            if (error) document.getElementById('loginError').innerText = error;
            else { document.getElementById('loginForm').classList.add('hidden'); document.getElementById('profileForm').classList.remove('hidden'); }
        } else if (form === 'profile') {
            const name = document.getElementById('profileName').value;
            const phone = document.getElementById('profilePhone').value;
            if (!name || !phone) error = "All fields are required.";
            else if (!/^\d{10}$/.test(phone)) error = "Phone must be 10 digits.";
            if (error) document.getElementById('profileError').innerText = error;
            else { document.getElementById('profileForm').classList.add('hidden'); document.getElementById('paymentForm').classList.remove('hidden'); }
        } else if (form === 'payment') {
            const cardNumber = document.getElementById('cardNumber').value;
            const expiryDate = document.getElementById('expiryDate').value;
            const cvv = document.getElementById('cvv').value;
            if (!cardNumber || !expiryDate || !cvv) error = "All fields are required.";
            else if (!/^\d{16}$/.test(cardNumber)) error = "Card number must be 16 digits.";
            else if (!/^\d{3}$/.test(cvv)) error = "CVV must be 3 digits.";
            if (error) document.getElementById('paymentError').innerText = error;
        }
        return !error;
    }
</script>

</body>
</html>

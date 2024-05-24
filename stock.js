// Function to update inventory in local storage
function updateInventory(itemName, quantity, price, mfd, exp, isPurchase) {
    var inventory = JSON.parse(localStorage.getItem('inventory')) || {};

    if (isPurchase) {
        inventory[itemName] = inventory[itemName] || {};
        inventory[itemName].quantity = (inventory[itemName].quantity || 0) + quantity;
        inventory[itemName].price = price;
        inventory[itemName].mfd = mfd;
        inventory[itemName].exp = exp;
    } else {
        if (inventory[itemName]) {
            if (inventory[itemName].quantity >= quantity) {
                inventory[itemName].quantity -= quantity;
            } else {
                alert("Insufficient quantity in stock!");
                return;
            }
        } else {
            alert("Item not found in stock!");
            return;
        }
    }

    localStorage.setItem('inventory', JSON.stringify(inventory));
}


// Function to handle purchasing items
function purchaseItem() {
    var itemName = document.getElementById('itemName').value;
    var quantity = parseInt(document.getElementById('quantity').value, 10);
    var price = parseFloat(document.getElementById('price').value);
    var mfd = document.getElementById('mfd').value;
    var exp = document.getElementById('exp').value;

    updateInventory(itemName, quantity, price, mfd, exp, true);
    alert("Item purchased successfully!");
    window.location.href = 'index.html'; // Redirect to index page after purchase
}

// Function to handle selling items
function sellItem() {
    var itemName = document.getElementById('itemName').value;
    var quantity = parseInt(document.getElementById('quantity').value, 10);
    var price = parseFloat(document.getElementById('price').value);

    updateInventory(itemName, quantity, price, null, null, false);
    alert("Item sold successfully!");
    // Redirect to stock.html (or any other page) after selling
    window.location.href = 'index.html';
}

// Function to handle returning purchased items
function returnPurchaseItem() {
    var itemName = document.getElementById('itemName').value;
    var quantity = parseInt(document.getElementById('quantity').value, 10);
    var purchaseDate = document.getElementById('date').value;

    // Retrieve inventory data from localStorage
    var inventory = JSON.parse(localStorage.getItem('inventory')) || {};

    // Check if the item exists in inventory
    if (inventory[itemName]) {
        // If the item exists, update the quantity and add a negative entry for the returned items
        inventory[itemName].quantity -= quantity;

        // Add an entry for the returned items with negative quantity
        var returnEntry = {
            quantity: -quantity,
            date: purchaseDate // Assuming you want to keep track of the return date
        };

        // Push the return entry to the item's history
        inventory[itemName].history = inventory[itemName].history || [];
        inventory[itemName].history.push(returnEntry);

        // Update localStorage with the modified inventory data
        localStorage.setItem('inventory', JSON.stringify(inventory));

        alert("Item returned successfully!");
    } else {
        alert("Item not found in inventory!");
    }
    window.location.href = 'index.html';
}

// Function to handle returning sold items
function returnSaleItem() {
    var itemName = document.getElementById('itemName').value;
    var quantity = parseInt(document.getElementById('quantity').value, 10);

    // Retrieve inventory data from localStorage
    var inventory = JSON.parse(localStorage.getItem('inventory')) || {};

    // Check if the item exists in inventory
    if (inventory[itemName]) {
        // Update the quantity to add the returned items
        inventory[itemName].quantity += quantity;

        // Update localStorage with the modified inventory data
        localStorage.setItem('inventory', JSON.stringify(inventory));

        alert("Item returned successfully!");
    } else {
        alert("Item not found in inventory!");
    }
    window.location.href = 'index.html';
}


// Function to display inventory in the stock table
function displayInventory() {
    var stockTableBody = document.getElementById("stockTableBody");
    stockTableBody.innerHTML = "";

    var inventory = JSON.parse(localStorage.getItem('inventory')) || {};

    for (var itemName in inventory) {
        var itemData = inventory[itemName];
        var row = "<tr>";
        row += "<td>" + itemName + "</td>";
        row += "<td>" + itemData.quantity + "</td>";
        row += "<td>" + itemData.price + "</td>";
        row += "<td>" + itemData.mfd + "</td>";
        row += "<td>" + itemData.exp + "</td>";
        row += "</tr>";
        stockTableBody.innerHTML += row;
    }
}

// Display inventory when the page loads
window.onload = function() {
    displayInventory();
};



// Function to calculate the total purchase cost
function calculateTotalPurchaseCost() {
    var inventory = JSON.parse(localStorage.getItem('inventory')) || {};
    var totalPurchaseCost = 0;

    for (var itemName in inventory) {
        var itemData = inventory[itemName];
        totalPurchaseCost += itemData.quantity * itemData.price;
    }

    return totalPurchaseCost;
}

// Function to calculate the total sale revenue
function calculateTotalSaleRevenue() {
    // Implement this function based on how sale data is stored
    // For demonstration purposes, let's assume sale data is stored in a similar way as inventory
    var sales = JSON.parse(localStorage.getItem('sales')) || {};
    var totalSaleRevenue = 0;

    for (var itemName in sales) {
        var saleData = sales[itemName];
        totalSaleRevenue += saleData.quantity * saleData.price;
    }

    return totalSaleRevenue;
}

// Function to calculate the profit or loss
function calculateProfitOrLoss() {
    var totalPurchaseCost = calculateTotalPurchaseCost();
    var totalSaleRevenue = calculateTotalSaleRevenue();

    return totalSaleRevenue - totalPurchaseCost;
}



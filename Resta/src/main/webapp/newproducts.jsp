<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 500px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
            transition: background 0.3s;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container mt-5 d-flex justify-content-center">
    <div class="form-container">
        <h4 class="text-center mb-4">Add New Product</h4>
        <form action="addProductServlet" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label">Product Name</label>
                <input type="text" class="form-control" name="name" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea class="form-control" name="description" rows="3" required></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Price</label>
                <input type="number" class="form-control" name="price" step="0.01" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Category</label>
                <select class="form-select" name="category" required>
                    <option value="" selected disabled>Select Category</option>
                    <option value="Veg">Veg</option>
                    <option value="Non-Veg">Non-Veg</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Product Image</label>
                <input type="file" class="form-control" name="image" accept="image/*" required>
            </div>
            <button type="submit" class="btn btn-submit w-100">Add Product</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

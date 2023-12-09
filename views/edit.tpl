  <style>

    h1, h2 {
        color: #34acdb; /* Azul */
        transition: color 0.3s;
    }

    h1:hover, h2:hover {
        color: #000000; /* Verde al pasar el mouse */
    }

    button.btn {
        background-color: #3498db;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 8px;
        transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
    }

    button.btn:hover {
        background-color: #2980b9;
        transform: scale(1.05);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    table {
        width: 70%; 
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 6px 10px; 
        border: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #3498db;
        color: white;
    }

    tbody tr:nth-child(odd) {
        background-color: #f2f2f2;
    }

    tbody tr:hover {
        background-color: #ecf0f1;
    }

    input[type="text"],
    input[type="date"],
    select {
        padding: 8px;
        border-radius: 5px;
        border: 1px solid #ccc;
        width: 100%;
        box-sizing: border-box;
        margin-bottom: 10px;
    }

    input[type="text"]:focus,
    input[type="date"]:focus,
    select:focus {
        outline: none;
        border-color: #3498db;
        box-shadow: 0 0 5px #3498db;
    }
  </style>
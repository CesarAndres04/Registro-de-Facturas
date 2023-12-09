    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 20px;
            line-height: 1.6;
            background: rgb(2,0,36);
            background: linear-gradient(355deg, rgba(2,0,36,1) 0%, rgba(9,9,121,0.8043811274509804) 37%, rgba(0,212,255,1) 100%);
        }

        h1, h2 {
            color: #34acdb; /* Blue color */
            transition: color 0.3s;
        }

        h1:hover, h2:hover {
            color: #000000; /* Green color on hover */
        }

        .content-container {
            background-color: rgb(255, 255, 255);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 20px;
        }

        .content-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .btn{
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

        .btn:hover {
            background-color: #2980b9;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
      table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px 12px;
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
    </style>
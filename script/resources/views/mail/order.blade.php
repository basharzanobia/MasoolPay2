<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>New Order</title>
    <style>
    body{
        background-color: #edf2f7;
    }
    .invoice-box {
        max-width: 600px;
        margin: 40px auto;
        padding: 30px;
        border: 1px solid #eee;
        box-shadow: 0 0 10px rgba(0, 0, 0, .15);
        font-size: 16px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color: #555;
    }
    
    .invoice-box table {
        width: 100%;
        line-height: inherit;
        text-align: left;
    }
    
    .invoice-box table td {
        padding: 5px;
        vertical-align: top;
    }
    
    .invoice-box table tr td:nth-child(2) {
        text-align: right;
    }
    
    .invoice-box table tr.top table td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.top table td.title {
        font-size: 25px;
        line-height: 45px;
        color: #333;
    }
    
    .invoice-box table tr.information table td {
        padding-bottom: 40px;
    }
    
    .invoice-box table tr.heading td {
        background: #eee;
        border-bottom: 1px solid #ddd;
        font-weight: bold;
    }
    
    .invoice-box table tr.details td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.item td{
        border-bottom: 1px solid #eee;
    }
    
    .invoice-box table tr.item.last td {
        border-bottom: none;
    }
    
    .invoice-box table tr.total td:nth-child(2) {
        border-top: 2px solid #eee;
        font-weight: bold;
    }
    
    @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td {
            width: 100%;
            display: block;
            text-align: center;
        }
        
        .invoice-box table tr.information table td {
            width: 100%;
            display: block;
            text-align: center;
        }
    }
    
    /** RTL **/
    .rtl {
        direction: rtl;
        font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
    }
    
    .rtl table {
        text-align: right;
    }
    
    .rtl table tr td:nth-child(2) {
        text-align: left;
    }
    </style>
</head>

<body>
    <div class="invoice-box">
        <table cellpadding="0" cellspacing="0">
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="title">
                                Lenden
                            </td>
                            
                            <td>
                                Created: {{ Carbon\Carbon::parse($data['created_at'])->format('d-m-Y') }}<br>
                            </td>

                            
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr class="information">
                <td colspan="2">
                    <table>
                        <tr>
                            <td>
                                From: Lenden<br>
                            </td>
                            <td>Name: {{ $data['name'] }}
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        
            <tr class="heading">
                <td>Name</td>
                <td>Description</td>
            </tr>

            <tr class="item">
                <td>Plan</td>
                <td>{{ $data['plan'] }}</td>
            </tr>

            <tr class="item">
                <td>Payment Gateway</td>
                <td>{{ $data['payment_getway'] }}</td>
            </tr>

            <tr class="item">
                <td>Payment ID</td>
                <td>{{ $data['payment_id'] }}</td>
            </tr>

            <tr class="item">
                <td>Price</td>
                <td>{{ $data['price'] }}</td>
            </tr>
            

            <tr class="total">
                <td></td>
                <td>Total: {{ $data['price'] }} (USD)</td>
            </tr>
        </table>
    </div>
</body>
</html>

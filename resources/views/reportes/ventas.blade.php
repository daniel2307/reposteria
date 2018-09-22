@extends('layouts.app')

@section('content')
<form action="{{ url('reporte/venta') }}" method="get">
    <div class="form-row mt-1">
        <div class="col-2">
            <select class="mdb-select md-form colorful-select dropdown-primary" name="year">
                @foreach($años as $key => $value)
                <option value="{{ $value }}" {{ $año == $value ? 'selected' : '' }}>{{ $value }}</option>
                @endforeach
            </select>
            <label>Año:</label>
        </div>
        <div class="col-3">
            <select class="mdb-select md-form colorful-select dropdown-primary" name="month">
                <option value="1" {{ $mes == "1" ? 'selected' : '' }}>Enero</option>
                <option value="2" {{ $mes == "2" ? 'selected' : '' }}>Febrero</option>
                <option value="3" {{ $mes == "3" ? 'selected' : '' }}>Marzo</option>
                <option value="4" {{ $mes == "4" ? 'selected' : '' }}>Abril</option>
                <option value="5" {{ $mes == "5" ? 'selected' : '' }}>Mayo</option>
                <option value="6" {{ $mes == "6" ? 'selected' : '' }}>Junio</option>
                <option value="7" {{ $mes == "7" ? 'selected' : '' }}>Julio</option>
                <option value="8" {{ $mes == "8" ? 'selected' : '' }}>Agosto</option>
                <option value="9" {{ $mes == "9" ? 'selected' : '' }}>Septiembre</option>
                <option value="10" {{ $mes == "10" ? 'selected' : '' }}>Octubre</option>
                <option value="11" {{ $mes == "11" ? 'selected' : '' }}>Noviembre</option>
                <option value="12" {{ $mes == "12" ? 'selected' : '' }}>Diciembre</option>
            </select>
            <label>Mes:</label>
        </div>
        <div class="col-3">
            <button type="submit" class="btn btn-success noPrint"><i class="fa fa-eye mr-1"></i> Mostrar</button>
        </div>
        <div class="col-3">
            <a class="btn btn-info noPrint" onclick="window.print();"><i class="fa fa-print mr-1"></i> Imprimir</a>
        </div>
    </div>
</form>

<canvas id="barChart"></canvas>
<hr>
<h3>Detalle Ventas del mes</h3>
<div class="table-responsive-lg">
    <table id="dtModel" class="table table-striped table-sm" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm">FECHA</th>
                <th class="th-sm">TOTAL</th>
            </tr>
        </thead>
        <tbody>
            @php $total = 0; @endphp
            @foreach($data as $key => $value)
            <tr>
                <td>{{ $key }}</td>
                <td>{{ $value }}</td>
                @php
                    $total += $value;
                @endphp
            </tr>
            @endforeach
            <tr>
                <td></td>
                <td><b>{{ $total }}</b></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <th>FECHA</th>
                <th>TOTAL</th>
            </tr>
        </tfoot>
    </table>
</div>
@endsection

@push('scripts')
<script type="text/javascript">
    $(document).ready(function () {
        $('#cma-cmp-reporte').addClass('current-menu-ancestor current-menu-parent menu-item-has-children active');
        $('#a-reporte').addClass('active');
        $("#css-reporte").css("display", "block");
        $('#cmi-reporte-venta').addClass('current-menu-item');

    });

    //bar
    var ctxB = document.getElementById("barChart").getContext('2d');
    var myBarChart = new Chart(ctxB, {
        type: 'line',
        data: {
            labels: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"],
            datasets: [{
                label: 'Bs',
                data: [
                    @foreach($data as $key => $value)
                        {{ $value }},
                    @endforeach
                ],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
</script>
@endpush
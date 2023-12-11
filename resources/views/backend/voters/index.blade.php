@section('title', 'Polls list')
@extends('layouts.backend')

@section('content')
<!-- Site wrapper -->
<div class="wrapper">
    @include('partials.backend.nav')

    @include('partials.backend.aside', ['asideSelected' => 'Polls'])

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <h1>Polls Details</h1>
                    </div>
                    <div class="col-sm-6 row text-right">

                    </div>

                </div>
                <div class="row">
                    <div class="col-sm-12">
                        @include('partials.backend.flash-message')
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="container-fluid">

                <div class="row">
                    <div class="col-sm-12">

                    </div>
                </div>

            <div class="row">
            <div class="col-12">
            <!-- Default box -->
            <div class="card card-default card-outline">


                <!-- /.card-header -->
                <div class="card-body">
                    <table class="table table-bordered table-hover table-striped table_head" id="ajaxDatatable" style="width:100%">
                        <thead>
                            <tr>
                                <th style="width: 5%">ID</th>
                                <th style="width: 10%">Title</th>
                                <th style="width: 5%">Actions</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
                <!-- <div class="card-footer clearfix">

                </div> -->
            </div>
            <!-- /.card -->

            </div>
            </div>
            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    @include('partials.backend.footer')

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
@endsection


@section('bodyClass', 'hold-transition sidebar-mini pace-primary')

@section('styles')

@endsection

@section('scripts')
<script src="{{ asset('js/backend/voters/index.js') }}"></script>
@endsection

@section('title', 'Polls Edit')
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
                        <h1>Edit Polls</h1>
                    </div>
                    <div class="col-sm-6 row text-right">
                        <div class="col-12">
                            <a href="{{ route('backend.polls.index') }}" class="btn btn-primary"><i class="fa fa-angle-double-left"></i>Back</a>
                        </div>
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
            <div class="col-md-12">
                <form action="{{ route('backend.polls.update',$pollsData->id) }}" method="POST" id="editForm" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <input type="hidden" name="polls_id" value="{{ $pollsData->id }}">
            <!-- Default box -->
            <div class="card card-outline">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group required">
                            <label for="polls_name" class="col-form-label">Title</label>
                            <input id="polls_name" type="text" name="polls_name" value="{{ $pollsData->title }}" class="form-control @error('polls_name') is-invalid @enderror" placeholder="Enter Polls Name">
                                @error('polls_name')
                                    <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        @php
                        $temp = explode(' ',$pollsData->start_at);
                        @endphp
                        <div class="col-sm-6">
                            <div class="form-group required">
                                <label class="col-form-label" for="calibrationDatetime">Start Date</label>
                                <div class="input-group date" id="start_date" data-target-input="nearest">
                                    <input type="text" name="start_date" value="{{ date('d/m/Y',strtotime($pollsData->start_at)) }}" id="calibrationDatetime" class="form-control datetimepicker-input @error('start_date') is-invalid @enderror" data-target="#start_date" onkeydown="return false"  placeholder="Enter Start Date"  />
                                    <div class="input-group-append" data-target="#start_date" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                </div>
                                @error('start_date')
                                    <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group required">
                                <label class="col-form-label" for="calibrationDatetime">Start Time</label>
                                <div class="input-group date" id="timepicker" data-target-input="nearest">
                                    <input type="text" name="start_time" value="{{ $temp[1] }}" class="form-control datetimepicker-input" data-target="#timepicker">
                                    <div class="input-group-append" data-target="#timepicker" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="far fa-clock"></i></div>
                                    </div>
                                    </div>
                                @error('timepicker')
                                    <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group required">
                                <label class="col-form-label" for="calibrationDatetime">End Date</label>
                                <div class="input-group date" id="end_date" data-target-input="nearest">
                                    <input type="text" name="end_date" value="{{ date('d/m/Y',strtotime($pollsData->end_at)) }}" id="calibrationDatetime" class="form-control datetimepicker-input @error('end_date') is-invalid @enderror" data-target="#end_date" onkeydown="return false"  placeholder="Enter End Date"  />
                                    <div class="input-group-append" data-target="#end_date" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                </div>
                                @error('end_date')
                                    <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group required">
                                <label class="col-form-label" for="calibrationDatetime">End Time</label>
                                @php
                                         $temp2 = explode(' ',$pollsData->end_at);
                                @endphp
                                <div class="input-group date" id="endtimepicker" data-target-input="nearest">
                                    <input type="text" value="{{ $temp2[1] }}" name="end_time" class="form-control datetimepicker-input" data-target="#endtimepicker">
                                    <div class="input-group-append" data-target="#endtimepicker" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="far fa-clock"></i></div>
                                    </div>
                                    </div>
                                @error('endtimepicker')
                                    <span class="error invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="container">
                            <table id="myTable" class=" table order-list">
                                <thead>
                                    <tr>
                                        <td><b>Options</b></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($options as $key=>$options)
                                        <tr>
                                            <td class="col-sm-4">
                                                <input type="text" name="options[][content]" value="{{ $options->content }}"class="form-control" />
                                            </td>

                                            <td class="col-sm-2"><input type="button" class="ibtnDel btn btn-md btn-danger valid" value="Delete" aria-invalid="false">
                                            </td>
                                        </tr>
                                        @endforeach
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="5" style="text-align: left;">
                                            <input type="button" class="btn btn-primary" id="addrow" value="Add Row" />
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                </tfoot>
                            </table>
                            </div>
                        </div>



                    </div>

                </div>

            </div>
            <!-- /.card-body -->
            <div class="mb-2">

                <button type="submit" id="editBtn" class="btn btn-info">Update</button>
                <a type="button" class="btn btn-danger" href="{{ route('backend.polls.index') }}">Cancel</a>
            </div>

            <!-- /.card-footer-->
            <!-- /.card -->
            </form>
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

<script src="{{ asset('js/backend/polls/edit.js') }}"></script>
@endsection

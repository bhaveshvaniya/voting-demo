@section('title', 'Polls Create')
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
                        <h1>Give Vote</h1>
                    </div>
                    <div class="col-sm-6 row text-right">
                        <div class="col-12">
                            <a href="{{ route('backend.voters.index') }}" class="btn btn-primary"><i class="fa fa-angle-double-left"></i>Back</a>
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
            <form action="{{ route('backend.voters.store') }}" method="POST" id="addForm" enctype="multipart/form-data">
                @csrf
            <!-- Default box -->
            <div class="card card-outline">
                <div class="card-body">
                    <div class="row">
                         <input type="hidden" name="poll_id" id="poll_id" value="{{ $poll->id }}" />
                        <div class="col-sm-12">
                            <div class="form-group">
                            <label for="polls_name" class="col-form-label"><h4>{{ $poll->title}}</h4></label>

                        </div>

                        <div class="col-sm-12">
                            <div class="form-group">
                                @foreach($poll->options as $option)

                                <p>
                                 <label>
                                   <input name="option_id" type="radio" class="" value="{{$option->id}}" @if($selectedOption) @if($selectedOption->option_id == $option->id) checked @endif @endif />
                                   <span>{{$option->content}}    ( Total Vote : {{$option->votes_count}} )</span>
                                 </label>
                             </p>
                             @endforeach

                        </div>

                    </div>

                </div>

            </div>
            <!-- /.card-body -->
            <div class="mb-2">

                <button type="submit" id="addBtn" class="btn btn-info">Save</button>
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
<script src="{{ asset('js/backend/polls/create.js') }}"></script>
@endsection

<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Option;
use App\Models\Poll;
use DataTables;
use Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class PollController extends Controller
{
     /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {

        $this->middleware('auth');
        $this->middleware(['role:Admin']);

    }

    /**
     * Display a listing of polls the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('backend.polls.index');
    }

    /**
     * Display a listing of polls the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function list(Request $request)
    {

        if ($request->ajax()) {
            $data = auth()->user()->polls()->select('title','status','id')->get();
            return Datatables::of($data)
            ->addIndexColumn()
            ->addColumn('actions', function($row){
                $finalIcons = '<a href="'.route('backend.polls.edit',$row->id).'" data-toggle="tooltip" data-placement="top" title="Edit" class="edit"><img src='.asset("uploads/edit.png").'></a>&nbsp;<a href="javascript:void(0)" url="'.route('backend.polls.delete',$row->id).'" id="'.$row->id.'" onclick="deleteRow(this)" data-toggle="tooltip" data-placement="top" title="Delete" class="edit"><img src='.asset("uploads/delete.png").'></a>&nbsp;<a href="'.route('backend.polls.view',['id' => $row->id]).'" data-toggle="tooltip" data-placement="top" title="View" class="view"><img src='.asset("uploads/eye.png").'></a>';
                $btn = $finalIcons;
                return $btn;
            })
            ->rawColumns(['actions'])
            ->make(true);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.polls.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->merge(['start_date' => date("Y-m-d", strtotime(str_replace('/', '-',$request->start_date)))]);
        $request->merge(['end_date' => date("Y-m-d", strtotime(str_replace('/', '-',$request->end_date)))]);
        $polls = new Poll();
        $polls->title = $request->polls_name;
        $polls->created_by = Auth::user()->id;
        $polls->start_at = Carbon::parse($request->start_date.' '.$request->start_time)->toDateTimeString();
        $polls->end_at = Carbon::parse($request->end_date.' '.$request->end_time)->toDateTimeString();
        $polls->save();
        $options_data = [];
        if($request->options){
            foreach ($request->options as $key => $value) {
                $options_data[] = $value;
            }
        }
        $polls->options()->createMany($options_data);
        return redirect()->route('backend.polls.index')->with('success','Polls added successfully.');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Chemical  $chemical
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $pollsData = Poll::find($id);
        $options = $pollsData->options()->get();
        return view('backend.polls.edit',compact('pollsData','options'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Chemical  $chemical
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $polls = Poll::find($request->polls_id);

        $request->merge(['start_date' => date("Y-m-d", strtotime(str_replace('/', '-',$request->start_date)))]);
        $request->merge(['end_date' => date("Y-m-d", strtotime(str_replace('/', '-',$request->end_date)))]);

        $polls->title = $request->polls_name;
        $polls->created_by = Auth::user()->id;
        $polls->start_at = Carbon::parse($request->start_date.' '.$request->start_time)->toDateTimeString();
        $polls->end_at = Carbon::parse($request->end_date.' '.$request->end_time)->toDateTimeString();
        $polls->save();

        $Optiondelete = Option::where('poll_id',$request->polls_id);
        $Optiondelete->delete();

        $options_data = [];
        if($request->options){
            foreach ($request->options as $key => $value) {
                $options_data[] = $value;
            }
        }
        $polls->options()->createMany($options_data);

        return redirect()->route('backend.polls.index')
        ->with('success','Polls upated successfully.');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Poll  polls
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {

        $polls = Poll::findOrFail($id);
        $polls->options()->delete();
        $polls->delete();
    }

     /**
     * Display the specified resource.
     *
     * @param  \App\Models\Poll  $user
     * @return \Illuminate\Http\Response
     */
    public function view(Request $request)
    {
        $poll_id = $request->id;
        $poll = Poll::where('id',$poll_id)->first();
        $selectedOption = $poll->options()->get();
        return view('backend.polls.view',compact('poll','selectedOption'));
    }

}

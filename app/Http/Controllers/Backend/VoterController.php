<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Option;
use App\Models\Poll;
use App\Models\Vote;
use DataTables;
use Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class VoterController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {

        $this->middleware('auth');
        $this->middleware(['role:Voter']);

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('backend.voters.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $poll_id = $request->poll_id;
        $poll = Poll::where('id',$poll_id)->first();
        //$selectedOption = $poll->options()->get();
        $selectedOption = $poll->votes()->where('user_id', auth()->id())->first();

        return view('backend.voters.create',compact('poll','selectedOption'));
    }

    /**
     * Display a listing of polls the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function list(Request $request)
    {

        if ($request->ajax()) {
            $data = Poll::all();
            return Datatables::of($data)
            ->addIndexColumn()
            ->addColumn('actions', function($row){

                $finalIcons = '<a href="'.route('backend.voters.create',['poll_id' => $row->id]).'" data-toggle="tooltip" data-placement="top" title="Edit" class="edit">Give Vote</a>';

                $btn = $finalIcons;

                return $btn;
            })
            ->rawColumns(['actions'])
            ->make(true);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $pollId = $request->poll_id;
        $poll = Poll::where('id',$pollId)->first();
        $selectedOption = $poll->votes()->where('user_id', auth()->id())->first();


        $poll->votes()->updateOrCreate(['user_id'=>auth()->id()],['option_id'=>$request->option_id]);

        $newOption =  Option::find($request->option_id);
        $newOption->increment('votes_count');

        // if ($selectedOption) {
        //     $selectedOption->decrement('votes_count');
        // }

        return redirect()->route('backend.voters.index')->with('success','Vote added successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

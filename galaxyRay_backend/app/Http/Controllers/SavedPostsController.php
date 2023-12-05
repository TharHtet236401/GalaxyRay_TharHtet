<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Like;
use App\Models\SavedPosts;

class SavedPostsController extends Controller
{
    //

    public function saveOrUnsave($id)
    {
        $post = Post::find($id);

        if(!$post)
        {
            return response([
                'message' => 'Post not found.'
            ], 403);
        }

        $save = $post->saves()->where('user_id', auth()->user()->id)->first();

        // if not liked then like
        if(!$save)
        {
            SavedPosts::create([
                'post_id' => $id,
                'user_id' => auth()->user()->id
            ]);

            return response([
                'message' => 'Saved'
            ], 200);
        }
        // else dislike it
        $save->delete();

        return response([
            'message' => 'Unsaved'
        ], 200);
    }


}

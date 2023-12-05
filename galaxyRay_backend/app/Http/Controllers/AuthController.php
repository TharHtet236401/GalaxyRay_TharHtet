<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class AuthController extends Controller
{
    //Register user
    public function register(Request $request)
    {
        //validate fields
        $attrs = $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6|confirmed'
        ]);

        //create user
        $user = User::create([
            'name' => $attrs['name'],
            'email' => $attrs['email'],
            'password' => bcrypt($attrs['password'])
        ]);

        //return user & token in response
        return response([
            'user' => $user,
            'token' => $user->createToken('secret')->plainTextToken
        ], 200);
    }

    // login user
    public function login(Request $request)
    {
        //validate fields
        $attrs = $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:6'
        ]);

        // attempt login
        if(!Auth::attempt($attrs))
        {
            return response([
                'message' => 'Invalid credentials.'
            ], 403);
        }

        //return user & token in response
        return response([
            'user' => auth()->user(),
            'token' => auth()->user()->createToken('secret')->plainTextToken
        ], 200);
    }

    // logout user
    public function logout()
    {
        auth()->user()->tokens()->delete();
        return response([
            'message' => 'Logout success.'
        ], 200);
    }

    // get user details
    public function user()
    {
        return response([
            'user' => auth()->user()
        ], 200);
    }

    // update user version 1 
    public function update(Request $request)
    {
        $attrs = $request->validate([
            'name' => 'required|string'
        ]);

        $image = $this->saveImage($request->image, 'profiles');

        auth()->user()->update([
            'name' => $attrs['name'],
            'image' => $image
        ]);

        return response([
            'message' => 'User updated.',
            'user' => auth()->user()
        ], 200);
    }


    // version 2 
//     public function update(Request $request)
// {
//     $attrs = $request->validate([
//         'name' => 'required|string'
//     ]);

//     $user = auth()->user();

//     if ($request->hasFile('image')) {
//         // If an image is provided, save it and update the 'image' field
//         $image = $this->saveImage($request->file('image'), 'profiles');
//         $user->update(['image' => $image]);
//     }

//     $user->update(['name' => $attrs['name']]);

//     return response([
//         'message' => 'User updated.',
//         'user' => $user
//     ], 200);
// }

// version 3 
// public function update(Request $request)
// {
//     $attrs = $request->validate([
//         'name' => 'required|string'
//     ]);

//     $user = auth()->user();

//     if ($request->hasFile('image')) {
//         // Scenario 1: If an image is provided, save it and update the 'image' field
//         $image = $this->saveImage($request->file('image'), 'profiles');
//         $user->update(['image' => $image]);
//     }

//     // Scenario 2: Update the 'name' field
//     $user->update(['name' => $attrs['name']]);

//     return response([
//         'message' => 'User updated.',
//         'user' => $user
//     ], 200);
// }

//version 4
// public function update(Request $request)
// {
//     $attrs = $request->validate([
//         'name' => 'required|string'
//     ]);

//     $user = auth()->user();

//     if ($request->hasFile('image')) {
//         // Scenario 1: If an image is provided, save it and update the 'image' field
//         $image = $this->saveImage($request->file('image'), 'profiles');
//         $user->update(['image' => $image]);
//     }

//     // Scenario 2: Update the 'name' field
//     $user->update(['name' => $attrs['name']]);

//     return response([
//         'message' => 'User updated.',
//         'user' => $user
//     ], 200);
// }

// public function update(Request $request)
// {
//     $attrs = $request->validate([
//         'name' => 'required|string'
//     ]);

//     $user = auth()->user();

//     if ($request->hasFile('image')) {
//         // Scenario 1: If a new image is provided, save it and update the 'image' field
//         $image = $this->saveImage($request->file('image'), 'profiles');
//         $user->update(['image' => $image]);
//     }

//     // Scenario 2: Update the 'name' field
//     $user->update(['name' => $attrs['name']]);

//     return response([
//         'message' => 'User updated.',
//         'user' => $user
//     ], 200);
// }

}

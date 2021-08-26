package com.impactpocproject

import android.location.Location
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Transformations.map
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import com.google.android.gms.tasks.OnSuccessListener

class MapActivity : AppCompatActivity(), OnMapReadyCallback, OnSuccessListener<Location> {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_map)
        getMapAsync()
        setRecyclerView()
    }

    private fun getMapAsync() {
        val mapFragment = supportFragmentManager.findFragmentById(R.id.map) as SupportMapFragment?
        mapFragment?.getMapAsync(this)
    }

    override fun onMapReady(googleMap: GoogleMap?) {
        googleMap ?: return
        with(googleMap){
            moveCamera(CameraUpdateFactory.newLatLngZoom(LatLng(-33.862,151.21),13f))
            addMarker(MarkerOptions().position(LatLng(-33.862,151.21)))
        }
    }

    override fun onSuccess(p0: Location?) {
//        setRecyclerView()
    }

    private fun setRecyclerView() {
        val recyclerView = findViewById(R.id.recyclerview) as? RecyclerView
        val itemDecoration = DividerItemDecoration(this, DividerItemDecoration.VERTICAL)
        recyclerView?.addItemDecoration(itemDecoration)

        val adapter = RecyclerViewAdapter()
        recyclerView?.layoutManager = LinearLayoutManager(this)
        recyclerView?.adapter = adapter
    }
}
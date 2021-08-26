package com.impactpocproject

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView


class RecyclerViewAdapter() :
    RecyclerView.Adapter<RecyclerViewAdapter.CustomViewHolder>() {
    class CustomViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val lat_value: TextView
        val long_value: TextView
        val row_image: ImageView

        init {
            lat_value = view.findViewById(R.id.lat_value)
            long_value = view.findViewById(R.id.long_value)
            row_image = view.findViewById(R.id.row_image)
        }

    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CustomViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.location_row, parent, false)
        return CustomViewHolder(view)
    }

    override fun onBindViewHolder(holder: CustomViewHolder, position: Int) {
        setView(holder)
    }

    private fun setView(holder: CustomViewHolder) {
        holder.long_value.text = 23.33.toString()
        holder.lat_value.text = 34.34.toString()
    }

    override fun getItemCount() = 50

}
package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class Category {
    private String id;
    private String category_name;
    private String rank;
    private String top_id;
    private List<Category> seconds;

    public Category(String id, String category_name, String rank, String top_id) {

        this.id = id;
        this.category_name = category_name;
        this.rank = rank;
        this.top_id = top_id;
    }
}

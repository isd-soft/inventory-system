/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Ed
 */
public class Type {
    String type_id;
    String type_name;
    String type_prefix;
    public String getType_id() {
        return type_id;
    }

    public void setType_id(String type_id) {
        this.type_id = type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String name) {
        this.type_name = name;
    }

    public String getType_prefix() {
        return type_prefix;
    }

    public void setType_prefix(String type_prefix) {
        this.type_prefix = type_prefix;
    }

}

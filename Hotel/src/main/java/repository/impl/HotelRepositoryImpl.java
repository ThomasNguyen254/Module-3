package repository;

import model.Hotel;

import java.sql.SQLException;
import java.util.List;

public class HotelRepositoryImpl implements IHotelRepository{

    @Override
    public List<Hotel> findAll() {
        return null;
    }

    @Override
    public boolean add(Hotel hotel) {
        return false;
    }

    @Override
    public boolean update(Hotel hotel) throws SQLException {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public Hotel findById(String id) {
        return null;
    }

    @Override
    public Hotel findByName(String name) {
        return null;
    }
}

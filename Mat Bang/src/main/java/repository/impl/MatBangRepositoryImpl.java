package repository;

import model.MatBang;

import java.sql.SQLException;
import java.util.List;

public class MatBangRepositoryImpl implements IMatBangRepository {

    @Override
    public List<MatBang> findAll() {
        return null;
    }

    @Override
    public boolean add(MatBang matBang) {
        return false;
    }

    @Override
    public boolean update(MatBang matBang) throws SQLException {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public MatBang findById(String id) {
        return null;
    }

    @Override
    public MatBang findByName(String name) {
        return null;
    }

    @Override
    public MatBang findByFloor(int floor) {
        return null;
    }

    @Override
    public MatBang findByPrice(float price) {
        return null;
    }

    @Override
    public MatBang findByType(String type) {
        return null;
    }
}

package repository;

import model.Household;

import java.sql.SQLException;
import java.util.List;

public class HouseholdRepositoryImpl implements IHouseholdRepository{

    @Override
    public List<Household> findAll() {
        return null;
    }

    @Override
    public boolean add(Household household) {
        return false;
    }

    @Override
    public boolean update(Household household) throws SQLException {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public Household findById(String id) {
        return null;
    }

    @Override
    public Household findByName(String name) {
        return null;
    }
}

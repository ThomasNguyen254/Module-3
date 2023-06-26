package service;

import model.Household;
import repository.HouseholdRepositoryImpl;
import repository.IHouseholdRepository;

import java.sql.SQLException;
import java.util.List;

public class HouseholdImpl implements IHouseholdService{
    private IHouseholdRepository householdRepository = new HouseholdRepositoryImpl();

    @Override
    public List<Household> findAll() {
        return householdRepository.findAll();
    }

    @Override
    public boolean add(Household household) {
        return householdRepository.add(household);
    }

    @Override
    public boolean update(Household household) throws SQLException {
        return householdRepository.update(household);
    }

    @Override
    public boolean delete(String id) {
        return householdRepository.delete(id);
    }

    @Override
    public Household findById(String id) {
        return householdRepository.findById(id);
    }

    @Override
    public Household findByName(String name) {
        return householdRepository.findByName(name);
    }
}

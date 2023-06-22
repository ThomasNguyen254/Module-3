package service;

import model.Household;
import java.sql.SQLException;
import java.util.List;

public interface HouseholdService {
    List<Household> findAll();

    boolean add(Household household);

    boolean update(Household household) throws SQLException;

    boolean delete(int id);

    Household findById(int id);

    Household findByName(String name);
}

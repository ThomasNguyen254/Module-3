package service;

import model.MatBang;
import repository.IMatBangRepository;
import repository.MatBangRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class MatBangImpl implements IMatBangService{
    IMatBangRepository iMatBangRepository = new MatBangRepositoryImpl();


    @Override
    public List<MatBang> findAll() {
        return iMatBangRepository.findAll();
    }

    @Override
    public boolean add(MatBang matBang) {
        return iMatBangRepository.add(matBang);
    }

    @Override
    public boolean update(MatBang matBang) throws SQLException {
        return iMatBangRepository.update(matBang);
    }

    @Override
    public boolean delete(String id) {
        return iMatBangRepository.delete(id);
    }

    @Override
    public MatBang findById(String id) {
        return iMatBangRepository.findById(id);
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

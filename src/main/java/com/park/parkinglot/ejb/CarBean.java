/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.park.parkinglot.ejb;

import com.park.parkinglot.common.CarDetails;
import com.park.parkinglot.common.PhotoDetails;
import com.park.parkinglot.entity.Car;
import com.park.parkinglot.entity.Photo;
import com.park.parkinglot.entity.User;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author Teodor
 */
@Stateless
public class CarBean {

    private static final Logger LOG = Logger.getLogger(CarBean.class.getName());

    @PersistenceContext
    private EntityManager em;

    public List<CarDetails> getAllCars() {
        LOG.info("getAllCars");
        try {
            List<Car> cars = (List<Car>) em.createQuery("SELECT c FROM Car c").getResultList();
            return copyCarsToDetails(cars);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    private List<CarDetails> copyCarsToDetails(List<Car> cars) {
        List<CarDetails> cdl = new ArrayList<>();
        for (Car c : cars) {
            CarDetails cd = new CarDetails(c.getId(),
                    c.getLicensePlate(),
                    c.getParkingSpot(),
                    c.getUser().getUsername());
            cdl.add(cd);
        }

        return cdl;
    }
    
    public void createCar(String plate, String spot, Integer userID) {
        LOG.info("createCar");
        Car car = new Car();
        car.setLicensePlate(plate);
        car.setParkingSpot(spot);
        
        User user =em.find(User.class, userID);
        user.getCars().add(car);
        car.setUser(user);
        
        em.persist(car);
    }
    
    public void updateCar(Integer carId, String plate, String spot, Integer userId) {
        LOG.info("updateCar");
        Car car = em.find(Car.class, carId);
        car.setLicensePlate(plate);
        car.setParkingSpot(spot);
        
        User oldUser = car.getUser();
        oldUser.getCars().remove(car);
        
        User user = em.find(User.class, userId);
        user.getCars().add(car);
        car.setUser(user);
    }
    
    public CarDetails findByID(Integer id) {
        Car car = em.find(Car.class, id);
        return new CarDetails(car.getId(), car.getLicensePlate(), car.getParkingSpot(), car.getUser().getUsername());
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public void deleteCarsById(List<Integer> carIds) {
        LOG.info("DeleteCarById");
        for (Integer id : carIds) {
            Car car = em.find(Car.class, id);
            em.remove(car);
        }
    }
    
    public void addPhotoToCar(Integer carId, String filename, String fileType, byte[] fileContent) {
        LOG.info("addPhotoToCar");
        Photo photo = new Photo();
        photo.setFilename(filename);
        photo.setFileType(fileType);
        photo.setFileContent(fileContent);
        
        Car car = em.find(Car.class, carId);
        car.setPhoto(photo);
        photo.setCar(car);
        em.persist(photo);
    }
    
    public PhotoDetails findPhotoByCar(Integer id) {
        TypedQuery<Photo> q = em.createQuery("SELECT p FROM Photo p WHERE p.car.id = :id", Photo.class)
                .setParameter("id", id);
        List<Photo> photos = q.getResultList();
        if(photos.isEmpty()) {
            return null;
        } else {
            Photo photo = photos.get(0);
            return new PhotoDetails (photo.getId(), photo.getFilename(), photo.getFileType(), 
            photo.getFileContent());
        }
    }
}

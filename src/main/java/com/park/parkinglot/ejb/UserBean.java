/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.park.parkinglot.ejb;

import com.park.parkinglot.common.CarDetails;
import com.park.parkinglot.common.UserDetails;
import com.park.parkinglot.entity.Car;
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

/**
 *
 * @author Teodor
 */
@Stateless
public class UserBean {

    private static final Logger LOG = Logger.getLogger(UserBean.class.getName());

    @PersistenceContext
    private EntityManager em;

    public List<UserDetails> getAllUsers() {
        Query query = em.createQuery("SELECT u FROM User u");
        List<User> users = (List<User>) query.getResultList();
        return copyUsersToDetails(users);
    }

    private List<UserDetails> copyUsersToDetails(List<User> users) {
        List<UserDetails> udl = new ArrayList<>();
        for (User u : users) {
            UserDetails ud = new UserDetails(u.getId(),
                    u.getUsername(),
                    u.getEmail(),
                    u.getPosition()
            );
            udl.add(ud);
        }
        return udl;
    }
    
    public void createuser(String username, String email, String passSha256, String position) {
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(passSha256);
        user.setPosition(position);
        
        em.persist(user);
    }
    
    public Collection<String> findUsernames (Collection<Integer> ids) {
        LOG.info("findUsernames");
        List<String> names = (List<String>) em.createQuery("SELECT u.username FROM User u WHERE u.id IN ?1")
                .setParameter(1, ids)
                .getResultList();
        return names;
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
